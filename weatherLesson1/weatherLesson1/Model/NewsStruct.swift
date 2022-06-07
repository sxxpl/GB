//
//  NewsStruct.swift
//  weatherLesson1
//
//  Created by Артем Тихонов on 06.06.2022.
//

import UIKit

protocol NewsProtocol {
    var countOfLikes:Int{get set}
    var text:String{get set}
    var image:UIImage{get set}

}

struct News:NewsProtocol {
    var countOfLikes:Int
    var text:String
    var image:UIImage
}
