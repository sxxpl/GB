//
//  VKData.swift
//  weatherLesson1
//
//  Created by Артем Тихонов on 20.04.2022.
//

import Foundation
import RealmSwift

///структуры для парсинга друзей ВК
class VKFriends:Object, Decodable{
    @objc dynamic var  response:FriendsResponse?
    
    enum CodingKeys:String,CodingKey {
        case response
    }
}

final class FriendsResponse: Object, Decodable{
    @objc dynamic var count: Int = 0
    var items = List<FriendInformationResponse>()
    
    enum CodingKeys:String, CodingKey {
        case count
        case items
    }
    
    convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        items = try container.decode(List<FriendInformationResponse>.self, forKey: .items)
    }
}
 

class FriendInformationResponse:Object, Decodable{
    @objc dynamic var id:Int
    @objc dynamic var firstName:String
    @objc dynamic var lastName:String
    @objc dynamic var photoProfile:String
    
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
class VKGroups:Object, Decodable{
    @objc dynamic var response:GroupsResponse?
    
    enum CodingKeys:String,CodingKey {
        case response
    }
}

final class GroupsResponse:Object, Decodable{
    @objc dynamic var count: Int = 0
    var items = List<GroupInformationResponse>()
    
    enum CodingKeys:String, CodingKey {
        case count
        case items
    }
    
    convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        items = try container.decode(List<GroupInformationResponse>.self, forKey: .items)
    }
}

class GroupInformationResponse:Object, Decodable{
    @objc dynamic var name: String
    @objc dynamic var id: Int
    
    enum CodingKeys:String, CodingKey {
        case name
        case id
    }
}

///структуры для парсинга фото ВК
class VKFriendsPhoto:Object,Decodable{
    @objc dynamic var response:FriendsPhotoResponse?
    
    enum CodingKeys:String,CodingKey {
        case response
    }
}

final class FriendsPhotoResponse:Object, Decodable{
    @objc dynamic var count: Int = 0
    var items = List<FriendPhotoInformationResponse>()
    
    enum CodingKeys:String, CodingKey {
        case count
        case items
    }
    
    convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        items = try container.decode(List<FriendPhotoInformationResponse>.self, forKey: .items)
    }
}

final class FriendPhotoInformationResponse:Object,Decodable{
     var sizes=List<FriendPhotoSizes>()
    
    enum CodingKeys:String, CodingKey {
        case sizes
    }
    
    convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        sizes = try container.decode(List<FriendPhotoSizes>.self, forKey: .sizes)
    }
}

class FriendPhotoSizes:Object,Decodable {
    @objc dynamic var height:Int
    @objc dynamic var width:Int
    @objc dynamic var url:String
    @objc dynamic var type: String
    enum CodingKeys:String, CodingKey {
        case height
        case width
        case url
        case type
    }
}

///класс для новостей
class VKNews: Object, Decodable{
    @objc dynamic var response:VKResponse?
    
    enum CodingKeys:String,CodingKey {
        case response
    }
}

class VKResponse: Object, Decodable{
    var items = List<NewsItems>()
//    var profiles = List<NewsProfiles>()
    let nextFrom:String = ""
    
    enum CodingKeys:String,CodingKey {
        case items
//        case profiles
        case nextFrom = "next_from"
    }
}

 final class NewsItems: Object, Decodable{
    @objc dynamic var text:String
    @objc dynamic var likes:NewsLikes?
     
//     var attachments = List<NewsAttachments>()
    
    
    enum CodingKeys:String,CodingKey {
        case text
        case likes
//        case attachments
    }
}

//final class NewsProfiles: Object, Decodable{
//    @objc dynamic var firstName:String
//    @objc dynamic var lastName:String
//    @objc dynamic var photoProfile:String
//
//
//   enum CodingKeys:String,CodingKey {
//       case firstName = "first_name"
//       case lastName = "last_name"
//       case photoProfile = "photo_100"
//   }
//}



final class NewsLikes: Object, Decodable{
    @objc dynamic var count:Int
    
    enum CodingKeys:String,CodingKey {
        case count
    }
}

//final class NewsAttachments: Object, Decodable{
//    @objc dynamic var photo:NewsPhoto?
//    
//    enum CodingKeys:String,CodingKey {
//        case photo
//    }
//}
//
//final class NewsPhoto: Object, Decodable{
//    var sizes =  List<NewsPhotoSizes>()
//    
//    enum CodingKeys:String,CodingKey {
//        case sizes
//    }
//}
//
//final class NewsPhotoSizes: Object, Decodable{
//    @objc dynamic var url:String
//    
//    enum CodingKeys:String,CodingKey {
//        case url
//    }
//}
//
//
//
//
