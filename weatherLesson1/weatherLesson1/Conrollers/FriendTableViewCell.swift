//
//  FriendTableViewCell.swift
//  weatherLesson1
//
//  Created by Артем Тихонов on 16.02.2022.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nextButton: NSLayoutConstraint!
    @IBOutlet weak var friendImage: UIImageView!
    @IBOutlet weak var friendName: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
