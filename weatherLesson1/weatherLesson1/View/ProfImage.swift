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
    
    
    private func setupGesture() {
        let profImageTap = UITapGestureRecognizer(target: self, action: #selector(profImageTap))
        profImageTap.numberOfTapsRequired = 1
        addGestureRecognizer(profImageTap)
    }
    @objc private func profImageTap(_ tap:UITapGestureRecognizer){
        UIView.animate(withDuration: 0.3, delay: 0, options: .autoreverse, animations:{
            self.transform.scaledBy(x: 0.7, y: 0.7)
        } )
    }
    
    override func layoutSubviews() {
        image.layer.cornerRadius = bounds.width/2
        shadow.layer.cornerRadius = bounds.width/2
    }
}
