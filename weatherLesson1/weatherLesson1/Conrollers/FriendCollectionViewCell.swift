//
//  FriendCollectionViewCell.swift
//  weatherLesson1
//
//  Created by Артем Тихонов on 16.02.2022.
//

import UIKit

class FriendCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var friendPhoto: UIImageView!
    @IBOutlet weak var like: LikeControl!
    @IBOutlet weak var containerView:UIView!
    
    
    override func awakeFromNib() {
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapRecognizer))
        doubleTap.numberOfTapsRequired = 2
        containerView.addGestureRecognizer(doubleTap)
    }
    
    @objc func doubleTapRecognizer(_:UITapGestureRecognizer){
        print("tap")
        like.isLike.toggle()
        if like.isLike {
            like.likeImage.image = UIImage(systemName: "heart.fill")
        } else {
            like.likeImage.image = nil
        }
    }
}
