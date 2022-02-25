//
//  DrawningControl.swift
//  weatherLesson1
//
//  Created by Артем Тихонов on 21.02.2022.
//

import UIKit

@IBDesignable class DrawningControl:UIControl {
    
//    var image = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
//    image.layer.cornerRadius = image.frame.size.width/2
//    image.clipsToBounds = true
//    view.addSubview(image)
    
    
    @IBInspectable var isToggle: Bool = true
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else {return}
        
        let colorOne: CGColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        
        context.setFillColor(colorOne)
        
        context.saveGState()
        
        let colorRed: UIColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        context.setFillColor(colorRed.cgColor)
        
        if isToggle{
            
            
            let rectangleRed = CGRect(x: rect.width/2, y: rect.height/2, width: rect.width/4, height: rect.height/4)
            context.fill(rectangleRed)
        }
        
        context.move(to: CGPoint(x: rect.width/2, y: 0))
        context.addLine(to: CGPoint(x: rect.width/2, y: rect.height/2))
        context.addLine(to: CGPoint(x:0, y: rect.height/2))
        
        context.closePath()
        context.setLineWidth(5)
        context.setStrokeColor(UIColor.yellow.cgColor)
        context.strokePath()
        
        context.restoreGState()
        
        let triangle = UIBezierPath()
        triangle.move(to: CGPoint(x: 0, y: rect.height/2))
        
        triangle.addLine(to: CGPoint(x: 0, y: rect.height))
        triangle.addLine(to: CGPoint(x:rect.width/2, y: rect.height))
        triangle.close()
//        UIColor.green.setFill()
//        triangle.fill()
        
        context.addPath(triangle.cgPath)
        context.fillPath()
        
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.7
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame )
        setupGesture()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder )
        setupGesture()
    }
    
    private func setupGesture() {
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(tapDouble))
        doubleTap.numberOfTapsRequired = 2
        addGestureRecognizer(doubleTap)
        
//        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(tapDouble))
//        swipe.direction = .right
//        addGestureRecognizer(swipe)
    }
    
    @objc private func tapDouble(_ tap:UITapGestureRecognizer){
        print("tap")
        isToggle.toggle()
        
        sendActions(for: .valueChanged)
    }
    

}
