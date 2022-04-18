//
//  Session.swift
//  weatherLesson1
//
//  Created by Артем Тихонов on 11.04.2022.
//

import UIKit

class Session {
    static let instance = Session()
    
    var token:String?
    var userId:Int?
    
    private init() {}
}

