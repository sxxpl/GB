//
//  AuthorTableViewCell.swift
//  weatherLesson1
//
//  Created by Артем Тихонов on 01.06.2022.
//

import UIKit

class AuthorTableViewCell: UITableViewCell {

    @IBOutlet weak var authorImage: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    
    func configure(_ viewModel:NewsViewModel){
        self.authorImage = viewModel.authorImage
        self.authorLabel = viewModel.authorLabel
    }
}


