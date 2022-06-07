//
//  PhotoTableViewCell.swift
//  weatherLesson1
//
//  Created by Артем Тихонов on 01.06.2022.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!

    func configure(cellImage: UIImage){
        self.cellImage.image = cellImage
    
    }
}
