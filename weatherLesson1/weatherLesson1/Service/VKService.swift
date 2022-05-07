//
//  VKService.swift
//  weatherLesson1
//
//  Created by Артем Тихонов on 18.04.2022.
//

import Foundation
import UIKit
import RealmSwift

///класс загрузки информации из ВК
final class VKService {
    ///загрузка друзей пользователя
    func getFriends(completion: @escaping (() -> Void)) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method/friends.get"
        urlComponents.queryItems = [URLQueryItem(name: "user_id", value: String(Session.instance.userId!)),
                                    URLQueryItem(name: "order", value: "random"),
                                    URLQueryItem(name: "fields", value: "nickname,photo_100"),
                                    URLQueryItem(name: "access_token", value: Session.instance.token),
                                    URLQueryItem(name: "v", value: "5.131")]
        guard let url = urlComponents.url else {return}
        
        let request = URLRequest(url: url)
        print(url)
        URLSession.shared.dataTask(with: request) {[weak self]data, response, error in
            if let error = error  {
                print(error)
            }
            guard let data = data else {
                return
            }
            let decoder = JSONDecoder()
            do {
                let result = try decoder.decode(VKFriends.self, from: data)
                self?.saveFriends(friends: result)
                completion()
            }catch {
                print(error)
            }
        }.resume()
    }
    
    
//    func getFriendsInfo(usersIds:String,completion: @escaping ((Result<FriendInformation,Error>) -> ())) {
//        var urlComponents = URLComponents()
//        urlComponents.scheme = "https"
//        urlComponents.host = "api.vk.com"
//        urlComponents.path = "/method/users.get"
//        urlComponents.queryItems = [URLQueryItem(name: "user_ids", value: usersIds),
//                                    URLQueryItem(name: "name_case", value: "nom"),
//                                    URLQueryItem(name: "access_token", value: Session.instance.token),
//                                    URLQueryItem(name: "v", value: "5.131")]
//        guard let url = urlComponents.url else {return}
//        
//        let request = URLRequest(url: url)
//        
//        print(request)
//        
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error  {
//                print(error)
//            }
//            guard let data = data else {
//                return
//            }
//            let decoder = JSONDecoder()
//            do {
//                let result = try decoder.decode(FriendInformation.self, from: data)
//                completion(.success(result))
//            }catch {
//                completion(.failure(error))
//            }
//        }.resume()
//    }
//
    ///загрузrа групп пользователя
    func getGroup(completion: @escaping (() -> Void)) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method/groups.get"
        urlComponents.queryItems = [URLQueryItem(name: "user_id", value: String(Session.instance.userId!)),
                                    URLQueryItem(name: "extended", value: "1"),
                                    URLQueryItem(name: "access_token", value: Session.instance.token),
                                    URLQueryItem(name: "v", value: "5.131")]
        guard let url = urlComponents.url else {return}
        
        let request = URLRequest(url: url)
        
        
        print(request)
        
        URLSession.shared.dataTask(with: request) {[weak self]data, response, error in
            if let error = error  {
                print(error)
            }
            guard let data = data else {
                return
            }
            let decoder = JSONDecoder()
            do {
                let result = try decoder.decode(VKGroups.self, from: data)
                self?.saveGroups(groups: result)
                completion()
            }catch {
                print(error)
            }
        }.resume()
    }
    
    
    ///загрузка фото пользователя
    func getPhotos(id:Int,completion: @escaping (() -> Void)) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method/photos.get"
        urlComponents.queryItems = [URLQueryItem(name: "owner_id", value: String(id)),
                                    URLQueryItem(name: "album_id", value: "profile"),
                                    URLQueryItem(name: "count", value: "20"),
                                    URLQueryItem(name: "access_token", value: Session.instance.token),
                                    URLQueryItem(name: "v", value: "5.131")]
        guard let url = urlComponents.url else {return}
        
        let request = URLRequest(url: url)
        
        print(request)
        
        URLSession.shared.dataTask(with: request) {[weak self] data, response, error in
            if let error = error  {
                print(error)
            }
            guard let data = data else {
                return
            }
            let decoder = JSONDecoder()
            do {
                let result = try decoder.decode(VKFriendsPhoto.self, from: data)
                self?.saveFriendsPhoto(friendsPhotos: result)
                completion()
            }catch {
                print(error)
            }
        }.resume()
    }
}

private extension VKService {
    func saveFriends(friends: VKFriends){
        do {
            let realm = try Realm()
            let friendsOld = realm.objects(VKFriends.self)
            realm.beginWrite()
            realm.delete(friendsOld)
            realm.add(friends)
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }
    
    func saveGroups(groups: VKGroups){
        do {
            let realm = try Realm()
            let groupsOld = realm.objects(VKGroups.self)
            realm.beginWrite()
            realm.delete(groupsOld)
            realm.add(groups)
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }
    
    func saveFriendsPhoto(friendsPhotos: VKFriendsPhoto){
        do {
            let realm = try Realm()
            let friendsPhotosOld = realm.objects(VKFriendsPhoto.self)
            realm.beginWrite()
            realm.delete(friendsPhotosOld)
            realm.add(friendsPhotos)
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }
}
