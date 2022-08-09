//
//  LikeControl.swift
//  weatherLesson1
//
//  Created by Артем Тихонов on 25.02.2022.
//

import UIKit

class LikeControl: UIControl {

    @IBOutlet weak var likeImage:UIImageView!
    
    var isLike:Bool = false
    
    override func awakeFromNib() {
        likeImage.backgroundColor = .clear
        likeImage.tintColor = .myRed
    }


}
