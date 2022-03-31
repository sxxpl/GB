//
//  LaunchD0wnload.swift
//  weatherLesson1
//
//  Created by Артем Тихонов on 27.03.2022.
//

import UIKit

class LaunchD0wnload: UIView {

  
    @IBOutlet var first:UIView!
    @IBOutlet var second:UIView!
    @IBOutlet var third:UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        UIView.animate(withDuration: 0.6, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.first.alpha = 0
        })
        UIView.animate(withDuration: 0.6, delay: 0.2, options: [.repeat, .autoreverse], animations: {
            self.second.alpha = 0
        })
        UIView.animate(withDuration: 0.6, delay: 0.4, options: [.repeat, .autoreverse], animations: {
            self.third.alpha = 0
        })
    }
    
    override func layoutSubviews() {
        first.layer.cornerRadius = first.bounds.width/2
        second.layer.cornerRadius = second.bounds.width/2
        third.layer.cornerRadius = third.bounds.width/2
    }
   

}
