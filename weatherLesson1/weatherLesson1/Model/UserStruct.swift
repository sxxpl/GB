//
//  UserStruct.swift
//  weatherLesson1
//
//  Created by Артем Тихонов on 21.02.2022.
//

import UIKit

protocol UserProtocol {
    var name:String{get set}
    var image:UIImage?{get set}
}

struct User:UserProtocol {
    var name:String
    var image:UIImage?
}
