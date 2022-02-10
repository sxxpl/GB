//
//  ViewController.swift
//  weatherLesson1
//
//  Created by Артем Тихонов on 10.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let redView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(redView)
        redView.backgroundColor = .red
        
    }

    override func viewDidLayoutSubviews() {
        redView.frame = CGRect(x: 140, y: 300, width: 60, height: 60)
    }

}

