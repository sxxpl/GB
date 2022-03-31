//
//  NewsTableViewCell.swift
//  weatherLesson1
//
//  Created by Артем Тихонов on 08.03.2022.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var watchLabel: UILabel!
    @IBOutlet weak var repostButton: UIButton!
    @IBOutlet weak var likeCounter: UILabel!
    var likeFlag = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        watchLabel.text = "0"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func addLike(_ sender: Any) {
//        UIView.animate(withDuration: 0.25, delay: 0, options: .autoreverse, animations: {
//            self.likeButton.transform.rotated(by: 2)
//        })
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: {
            if !self.likeFlag {
                self.likeButton.configuration?.image = UIImage(systemName: "suit.heart.fill")
                self.likeButton.tintColor = .red
                self.likeCounter.text = String(Int(self.likeCounter.text!)!+1)
                self.likeFlag.toggle()
            } else {
                self.likeButton.configuration?.image = UIImage(systemName: "suit.heart")
                self.likeButton.tintColor = .blue
                self.likeCounter.text = String(Int(self.likeCounter.text!)!-1)
                self.likeFlag.toggle()
            }
        })
                       
    }
    
}
