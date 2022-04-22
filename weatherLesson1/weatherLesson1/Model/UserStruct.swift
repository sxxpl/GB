//
//  UserStruct.swift
//  weatherLesson1
//
//  Created by Артем Тихонов on 21.02.2022.
//

import UIKit

///структура для представления друга  в FriendTableViewController

protocol UserProtocol {
    var id:Int?{get set}
    var name:String{get set}
    var image:UIImage?{get set}
}

struct User:UserProtocol {

    
    init(name:String){
        self.name = name
    }
    
    init(name:String, image:UIImage,id:Int){
        self.name = name
        self.image = image
        self.id = id
    }
    
    init(name:String, image:UIImage){
        self.name = name
        self.image = image
    }
    var id: Int?
    var name:String
    var image:UIImage?
}
