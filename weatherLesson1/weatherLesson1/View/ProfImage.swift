//
//  ProfImage.swift
//  weatherLesson1
//
//  Created by Артем Тихонов on 25.02.2022.
//

import UIKit

class ProfImage: UIView {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var shadow: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        shadow.layer.shadowColor = UIColor.black.cgColor
        shadow.layer.shadowRadius = 7
        shadow.layer.shadowOffset = .zero
        shadow.layer.shadowOpacity=0.8
    }
    
    override func layoutSubviews() {
        image.layer.cornerRadius = bounds.width/2
        shadow.layer.cornerRadius = bounds.width/2
    }
}
