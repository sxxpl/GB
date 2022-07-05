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
    
    func configure(authorImage: UIImage,authorLabel: String){
        self.authorImage.image = authorImage
        self.authorLabel?.text = authorLabel
    }
    
}
