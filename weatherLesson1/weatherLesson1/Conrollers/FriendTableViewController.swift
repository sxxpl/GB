//
//  FriendTableViewController.swift
//  weatherLesson1
//
//  Created by Артем Тихонов on 16.02.2022.
//

import UIKit

class FriendTableViewController: UITableViewController {
    
    let service = VKService()
    var VKFriends: VKFriends?
//    var friendsInfo:FriendInformation?
    var friends=[User]()
    var sortedFriends = [Character:[User]]()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFriends()
    }

    private func sort(friends:[User])->[Character:[User]]{
        var friendDict = [Character:[User]]()
        friends.forEach(){friend in
            guard let firstChar = friend.name.first else {return}
            
            if var thisCharFriends = friendDict[firstChar]{
                thisCharFriends.append(friend)
                friendDict[firstChar] = thisCharFriends
            } else {
                friendDict[firstChar] = [friend]
            }
        }
        return friendDict
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sortedFriends.keys.count
//        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let keySorted = sortedFriends.keys.sorted()

        let friendsCount = sortedFriends[keySorted[section]]?.count ?? 0

        return friendsCount
        
//        return VKFriends?.response.count ?? 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendTableViewCell else {  preconditionFailure("error")
        }
        
        let firstChar = sortedFriends.keys.sorted()[indexPath.section]
        let friends = sortedFriends[firstChar]!

        let friend:User = friends[indexPath.row]

        cell.friendName.text = friend.name
//        cell.friendName.text = "\(VKFriends?.response.items[indexPath.row] ?? 123)"
        cell.friendImage.image.image = UIImage(named: "410773")
        return cell
    }


    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        String(sortedFriends.keys.sorted()[section])
    }
    
    private func loadFriends(){
        service.getFriends { [weak self] result in
            switch result {
            case .success(let friends):
                DispatchQueue.main.async {
                    self?.VKFriends = friends
//                    self?.loadFriendsInfo()
                    self?.infoTransform()
                    self?.sortedFriends = (self?.sort(friends: self?.friends ?? [])) ?? [:]
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
//    private func loadFriendsInfo(){
//        var userIds = ""
//        for id in VKFriends?.response.items ?? [] {
//            userIds += String(id) + ","
//        }
//        guard !userIds.isEmpty else {
//            return
//        }
//        userIds.removeLast()
//        service.getFriendsInfo(usersIds: userIds){ [weak self] result in
//            switch result {
//            case .success(let friends):
//                DispatchQueue.main.async {
//                    self?.friendsInfo = friends
//                    self?.infoTransform()
//                    self?.sortedFriends = (self?.sort(friends: self?.friends ?? [])) ?? [:[]]
//                    self?.tableView.reloadData()
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
    
    private func infoTransform(){
        for response in VKFriends?.response.items ?? [] {
            self.friends.append(User(name: response.first_name + " " + response.last_name))
        }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
