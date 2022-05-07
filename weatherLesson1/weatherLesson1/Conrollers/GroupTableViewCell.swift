//
//  GroupTableViewCell.swift
//  weatherLesson1
//
//  Created by Артем Тихонов on 21.02.2022.
//

import UIKit

class GroupTableViewCell: UITableViewCell {
    
    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var groupName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
