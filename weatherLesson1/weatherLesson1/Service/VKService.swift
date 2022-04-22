//
//  VKService.swift
//  weatherLesson1
//
//  Created by Артем Тихонов on 18.04.2022.
//

import Foundation
import UIKit
///класс загрузки информации из ВК
final class VKService {
    ///загрузка друзей пользователя
    func getFriends(completion: @escaping ((Result<VKFriends,Error>) -> ())) {
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
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error  {
                print(error)
            }
            guard let data = data else {
                return
            }
            let decoder = JSONDecoder()
            do {
                let result = try decoder.decode(VKFriends.self, from: data)
                completion(.success(result))
            }catch {
                completion(.failure(error))
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
    func getGroup(completion: @escaping ((Result<VKGroups,Error>) -> ())) {
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
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error  {
                print(error)
            }
            guard let data = data else {
                return
            }
            let decoder = JSONDecoder()
            do {
                let result = try decoder.decode(VKGroups.self, from: data)
                completion(.success(result))
            }catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    
    ///загрузка фото пользователя
    func getPhotos(id:Int,completion: @escaping ((Result<VKFriendsPhoto,Error>) -> ())) {
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
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error  {
                print(error)
            }
            guard let data = data else {
                return
            }
            let decoder = JSONDecoder()
            do {
                let result = try decoder.decode(VKFriendsPhoto.self, from: data)
                completion(.success(result))
            }catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
