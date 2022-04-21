//
//  VKData.swift
//  weatherLesson1
//
//  Created by Артем Тихонов on 20.04.2022.
//

import Foundation

struct VKFriends:Decodable{
    let response:FriendsResponse
    
    enum CodingCase:String,CodingKey {
        case response
    }
}

struct FriendsResponse: Decodable{
    let count: Int
    let items: [FriendInformationResponse]
    
    enum CodingCase:String, CodingKey {
        case count
        case items
    }
}

//struct FriendInformation: Decodable {
//    let response:[FriendInformationResponse]
//
//    enum CodingCase:String, CodingKey {
//        case response
//    }
//}

struct FriendInformationResponse:Decodable{
    let first_name:String
    let last_name:String
    
    enum CodingCase:String, CodingKey {
        case first_name
        case last_name 
    }
}




struct VKGroups:Decodable{
    let response:GroupsResponse
    
    enum CodingCase:String,CodingKey {
        case response
    }
}

struct GroupsResponse: Decodable{
    let count: Int
    let items: [GroupInformationResponse]
    
    enum CodingCase:String, CodingKey {
        case count
        case items
    }
}

struct GroupInformationResponse:Decodable{
    let name: String
    
    enum CodingCase:String, CodingKey {
        case name
    }
}

