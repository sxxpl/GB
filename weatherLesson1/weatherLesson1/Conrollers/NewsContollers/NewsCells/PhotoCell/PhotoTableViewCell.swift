//
//  PhotoTableViewCell.swift
//  weatherLesson1
//
//  Created by Артем Тихонов on 01.06.2022.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!

    func configure(_ viewModel:NewsViewModel){
        self.cellImage = viewModel.cellImage
    
    }
}
