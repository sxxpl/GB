//
//  LikeTableViewCell.swift
//  weatherLesson1
//
//  Created by Артем Тихонов on 01.06.2022.
//

import UIKit

class LikeTableViewCell: UITableViewCell {
    @IBOutlet weak var likeImage: UIButton!
    @IBOutlet weak var numberOfLikes: UILabel!
    var likeFlag = false;
    
    override func awakeFromNib() {
        super.awakeFromNib()
        numberOfLikes.text = "0"
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func addLike(_ sender: Any) {
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: {
            if !self.likeFlag {
                self.likeImage.configuration?.image = UIImage(systemName: "suit.heart.fill")
                self.likeImage.tintColor = .red
                self.numberOfLikes.text = String(Int(self.numberOfLikes.text!)!+1)
                self.likeFlag.toggle()
            } else {
                self.likeImage.configuration?.image = UIImage(systemName: "suit.heart")
                self.likeImage.tintColor = .blue
                self.numberOfLikes.text = String(Int(self.numberOfLikes.text!)!-1)
                self.likeFlag.toggle()
            }
        })
    }
    
}
