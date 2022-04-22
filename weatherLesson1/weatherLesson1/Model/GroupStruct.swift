//
//  GroupStruct.swift
//  weatherLesson1
//
//  Created by Артем Тихонов on 21.02.2022.
//

import UIKit


///структура для представления группы в GroupTableViewController
protocol GroupProtocol {
    var name:String{get set}
    var image:UIImage?{get set}
}

struct Group:GroupProtocol {
    var name:String
    var image:UIImage?
}
