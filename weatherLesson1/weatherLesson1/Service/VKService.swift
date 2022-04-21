//
//  VKService.swift
//  weatherLesson1
//
//  Created by Артем Тихонов on 18.04.2022.
//

import Foundation

final class VKService {
    func getFriends(completion: @escaping ((Result<VKFriends,Error>) -> ())) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method/friends.get"
        urlComponents.queryItems = [URLQueryItem(name: "user_id", value: String(Session.instance.userId!)),
                                    URLQueryItem(name: "order", value: "random"),
                                    URLQueryItem(name: "fields", value: "nickname"),
                                    URLQueryItem(name: "access_token", value: Session.instance.token),
                                    URLQueryItem(name: "v", value: "5.131")]
        guard let url = urlComponents.url else {return}
        
        let request = URLRequest(url: url)
        
        
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
    
    func getPhotos() {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method/photos.get"
        urlComponents.queryItems = [URLQueryItem(name: "owner_id", value: String(Session.instance.userId!)),
                                    URLQueryItem(name: "album_id", value: "wall"),
                                    URLQueryItem(name: "access_token", value: Session.instance.token),
                                    
                                    URLQueryItem(name: "v", value: "5.131")]
        guard let url = urlComponents.url else {return}
        
        let request = URLRequest(url: url)
        
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error  {
                print(error)
            }
            guard let data = data else {
                return
            }
            do {
                let result = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
            
            }catch {
                print(error)
            }
        }.resume()
    }
}
