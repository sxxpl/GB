//
//  TextTableViewCell.swift
//  weatherLesson1
//
//  Created by Артем Тихонов on 01.06.2022.
//

import UIKit

class TextTableViewCell: UITableViewCell {

    @IBOutlet weak var cellTextLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
