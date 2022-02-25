//
//  CanvasViewController.swift
//  weatherLesson1
//
//  Created by Артем Тихонов on 21.02.2022.
//

import UIKit

class CanvasViewController: UIViewController {
    
    @IBOutlet var drawningController : DrawningControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        drawningController.addTarget(self, action: #selector(drawControlChange), for: .valueChanged)
        // Do any additional setup after loading the view.
    }
    
    @objc private func drawControlChange(){
        drawningController.setNeedsDisplay()
        print(drawningController.isToggle)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        drawningController.setNeedsLayout()
        
        drawningController.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4).concatenating(CGAffineTransform(scaleX: 0.5, y: 0.5))
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
