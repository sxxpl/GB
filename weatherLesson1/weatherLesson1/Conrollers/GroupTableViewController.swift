//
//  GroupTableViewController.swift
//  weatherLesson1
//
//  Created by Артем Тихонов on 21.02.2022.
//

import UIKit
import RealmSwift

class GroupTableViewController: UITableViewController, UISearchBarDelegate {
    
    let service = VKService()
    var VKGroupsModel: Results<VKGroups>?
    var groups = [Group]()
    
    var searchActive = false
    var filtered:[Group] = []
    
    private var notificationToken: NotificationToken?
    
    let realm = RealmCacheService()
    
    private var groupRespons: Results<VKGroups>? {
        realm.read(VKGroups.self)
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        createNotificatoinToken()
        loadGroups()

        searchBar.delegate = self
    }
    
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    

   
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

           filtered = groups.filter({ (group) -> Bool in
               return group.name.contains(searchText)
           })
           if(filtered.count == 0){
               searchActive = false;
           } else {
               searchActive = true;
           }
           self.tableView.reloadData()
       }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searchActive {
            return filtered.count }
        return groups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as? GroupTableViewCell else
        {
            exit(0)
        }
        
        if searchActive {
            cell.groupName.text = filtered[indexPath.row].name
        } else {
            cell.groupName.text = groups[indexPath.row].name
        }

        return cell
    }
    
    private func loadGroups(){
        service.getGroup{ [weak self]  in
                DispatchQueue.main.async {
                    self?.VKGroupsModel = self?.groupRespons
//                    self?.loadFriendsInfo()
                    self?.infoTransform()
                    self?.tableView.reloadData()
                }
        }
    }
    
//    func loadGroupsFromRealm() -> Results<VKGroups>?{
//        do{
//            let realm = try Realm()
//            let groups = realm.objects(VKGroups.self)
//            return groups
//        } catch {
//            print(error)
//            return nil
//        }
//    }
    
    private func infoTransform(){
        for response in VKGroupsModel?.first?.response?.items ?? List<GroupInformationResponse>(){
            self.groups.append(Group(name: response.name, image: UIImage(named: "kot")))
        }
    }
    

    func createNotificatoinToken(){
        notificationToken = groupRespons?.observe{ [weak self] result in
            guard let self = self else {return}
            switch result{
            case .initial(let groupData):
                print("\(groupData.count)")
            case .update(let groups,
                         deletions: let deletions,
                         insertions: let insertions,
                         modifications: let modifications):
                let deletionsIndexpath = deletions.map{IndexPath(row: $0, section: $0)}
                let insertionsIndexpath = insertions.map{IndexPath(row: $0, section: $0)}
                let modificationsIndexpath = modifications.map{IndexPath(row: $0, section: $0)}
                
                DispatchQueue.main.async {
                    self.tableView.beginUpdates()
                    self.tableView.deleteRows(at: deletionsIndexpath, with: .automatic)
                    self.tableView.insertRows(at: insertionsIndexpath, with: .automatic)
                    self.tableView.reloadRows(at: modificationsIndexpath, with: .automatic)
                    self.tableView.endUpdates()
                }
            case .error(let error):
                print(error)
                }
            }
        }

}
