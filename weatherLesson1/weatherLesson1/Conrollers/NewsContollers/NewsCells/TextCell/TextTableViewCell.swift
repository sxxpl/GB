//
//  TextTableViewCell.swift
//  weatherLesson1
//
//  Created by Артем Тихонов on 01.06.2022.
//

import UIKit

class TextTableViewCell: UITableViewCell {

    @IBOutlet weak var cellTextLabel: UILabel?
    
    func configure(cellTextLabel: String){
        self.cellTextLabel?.text = cellTextLabel
        
    }
}
