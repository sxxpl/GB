//
//  VKData.swift
//  weatherLesson1
//
//  Created by Артем Тихонов on 20.04.2022.
//

import Foundation

///структуры для парсинга друзей ВК
struct VKFriends:Decodable{
    let response:FriendsResponse
    
    enum CodingKeys:String,CodingKey {
        case response
    }
}

struct FriendsResponse: Decodable{
    let count: Int
    let items: [FriendInformationResponse]
    
    enum CodingKeys:String, CodingKey {
        case count
        case items
    }
}


struct FriendInformationResponse:Decodable{
    let id:Int
    let firstName:String
    let lastName:String
    let photoProfile:String
    
    enum CodingKeys:String, CodingKey {
        case id = "id"
        case firstName = "first_name"
        case lastName = "last_name"
        case photoProfile = "photo_100"
    }
}
//struct FriendInformation: Decodable {
//    let response:[FriendInformationResponse]
//
//    enum CodingCase:String, CodingKey {
//        case response
//    }
//}



///структуры для парсинга групп ВК
struct VKGroups:Decodable{
    let response:GroupsResponse
    
    enum CodingKeys:String,CodingKey {
        case response
    }
}

struct GroupsResponse: Decodable{
    let count: Int
    let items: [GroupInformationResponse]
    
    enum CodingKeys:String, CodingKey {
        case count
        case items
    }
}

struct GroupInformationResponse:Decodable{
    let name: String
    
    enum CodingKeys:String, CodingKey {
        case name
    }
}

///структуры для парсинга фото ВК
struct VKFriendsPhoto:Decodable{
    let response:FriendsPhotoResponse
    
    enum CodingKeys:String,CodingKey {
        case response
    }
}

struct FriendsPhotoResponse: Decodable{
    let count: Int
    let items: [FriendPhotoInformationResponse]
    
    enum CodingKeys:String, CodingKey {
        case count
        case items
    }
}

struct FriendPhotoInformationResponse:Decodable{
    let sizes:[FriendPhotoSizes]
    
    enum CodingKeys:String, CodingKey {
        case sizes
    }
}

struct FriendPhotoSizes:Decodable {
    let height:Int
    let width:Int
    let url:String
    let type: String
    enum CodingKeys:String, CodingKey {
        case height
        case width
        case url
        case type
    }
}

