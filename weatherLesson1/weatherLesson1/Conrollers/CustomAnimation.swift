//
//  CustomAnimation.swift
//  weatherLesson1
//
//  Created by Артем Тихонов on 08.04.2022.
//

import UIKit

class PushAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    private let animationDuration: TimeInterval = 0.7
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return animationDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from),
            let destination = transitionContext.viewController(forKey: .to) else { return }
        
        transitionContext.containerView.addSubview(destination.view)
        
        source.view.frame = transitionContext.containerView.frame
        destination.view.frame = transitionContext.containerView.frame
        
        destination.view.transform = CGAffineTransform(rotationAngle: -90).concatenating(CGAffineTransform(translationX: destination.view.bounds.height, y: -(destination.view.bounds.height/2-destination.view.bounds.width/2)))
        
        UIView.animateKeyframes(withDuration: animationDuration, delay: 0, options: .calculationModePaced, animations: {
    
//            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.4, animations: {
//                let translation = CGAffineTransform(translationX: source.view.bounds.width/2,
//                                                    y: 0)
//                let scale = CGAffineTransform(scaleX: 1.2, y: 1.2)
//                destination.view.transform = translation.concatenating(scale)
//            })
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1 , animations: {
                destination.view.transform = .identity
            })
        }) { finished in
            if finished && !transitionContext.transitionWasCancelled {
                source.view.transform = .identity
            }
            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        }
    }
}

class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    private let animationDuration: TimeInterval = 1
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return animationDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from),
            let destination = transitionContext.viewController(forKey: .to) else { return }
        
        transitionContext.containerView.addSubview(destination.view)
        transitionContext.containerView.sendSubviewToBack(destination.view)
        
        source.view.frame = transitionContext.containerView.frame
        destination.view.frame = transitionContext.containerView.frame
        
        
        UIView.animateKeyframes(withDuration: animationDuration, delay: 0, options: .calculationModePaced, animations: {
            
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1, animations: {
                source.view.transform = CGAffineTransform(rotationAngle: -90).concatenating(CGAffineTransform(translationX: source.view.bounds.height, y: -(source.view.bounds.height/2-source.view.bounds.width/2)))
            })
        }) { finished in
            if finished && !transitionContext.transitionWasCancelled {
                source.removeFromParent()
            } else if transitionContext.transitionWasCancelled {
                destination.view.transform = .identity
            }
            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        }
    }
}
