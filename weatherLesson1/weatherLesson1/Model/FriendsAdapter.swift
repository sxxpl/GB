//
//  FriendsAdapter.swift
//  weatherLesson1
//
//  Created by Артем Тихонов on 09.08.2022.
//

import Foundation
import RealmSwift

final class FriendsAdapter {
    
    private let vkService = VKService()
    
    let photoService = PhotoService(container: UITableView())

    func getFriends(completion: @escaping ([User]) -> Void) {
        guard let realm = try? Realm() else {
            return
        }
        let realmFriends = Array(realm.objects(VKFriends.self))
        
        var vkFriends: [User] = []
        for realmFriend in realmFriends.first?.response?.items ?? List<FriendInformationResponse>(){
            vkFriends.append(self.weather(from: realmFriend)) }
        completion(vkFriends)
    }
    
    
    private func weather(from realmFriend: FriendInformationResponse) -> User {
        return User(name: realmFriend.firstName + "" + realmFriend.lastName, image: photoService.photo(byUrl: realmFriend.photoProfile) ?? UIImage(), id: realmFriend.id)
    }
    
}
        
