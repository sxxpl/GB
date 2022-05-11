
//  FriendTableViewController.swift
//  weatherLesson1
//
//  Created by Артем Тихонов on 16.02.2022.
//

import UIKit
import RealmSwift

class FriendTableViewController: UITableViewController {

    let service = VKService()
    var VKFriendsModel: Results<VKFriends>?
//    var friendsInfo:FriendInformation?
    var friends=[User]()
    var sortedFriends = [Character:[User]]()

    private var notificationToken: NotificationToken?

    let realm = RealmCacheService()

    private var friendRespons: Results<VKFriends>? {
        realm.read(VKFriends.self)
    }



    override func viewDidLoad() {
        super.viewDidLoad()
        createNotificatoinToken()
        loadFriends()
    }


    ///сортировка для отображения друзей по алфавиту
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
        cell.friendImage.image.image = friend.image
        return cell
    }


    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        String(sortedFriends.keys.sorted()[section])
    }


    ///загрузка друзей вк
    private func loadFriends(){
        service.getFriends { [weak self]  in
                DispatchQueue.main.async {
                    self?.VKFriendsModel = self?.friendRespons
//                    self?.loadFriendsInfo()
                    self?.infoTransform()
                    self?.sortedFriends = (self?.sort(friends: self?.friends ?? [])) ?? [:]
                    self?.tableView.reloadData()
                }
        }
    }

//    func loadFriendsFromRealm() -> Results<VKFriends>?{
//        do{
//            let realm = try Realm()
//            let friends = realm.objects(VKFriends.self)
//            return friends
//        } catch {
//            print(error)
//            return nil
//        }
//    }

/// преобразование информации из json  в обычный массив
    private func infoTransform(){
        let list = List<FriendInformationResponse>()
        for response in VKFriendsModel?.first?.response?.items ?? list {
            self.friends.append(User(name: response.firstName + " " + response.lastName,image: UIImage(data: try! Data(contentsOf: URL(string: response.photoProfile)!))!,id: response.id))
        }
    }

    ///передача id для загрузки фото
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LoadPhotos",
           let allPhotoVC = segue.destination as? FriendCollectionViewController,
           let selectedFriend = tableView.indexPathForSelectedRow
        {
            allPhotoVC.id = sortedFriends[sortedFriends.keys.sorted()[selectedFriend.section]]?[selectedFriend.row].id ?? 0
        }
    }

    func createNotificatoinToken(){
        notificationToken = friendRespons?.observe{ [weak self] result in
            guard let self = self else {return}
            switch result{
            case .initial(let friendData):
                print("\(friendData.count)")
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




