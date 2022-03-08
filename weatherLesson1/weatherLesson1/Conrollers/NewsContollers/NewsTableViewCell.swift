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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        watchLabel.text = "0"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
