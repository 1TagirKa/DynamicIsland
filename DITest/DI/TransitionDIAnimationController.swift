//
//  TransitionDIAnimationController.swift
//  DITest
//
//  Created by Tagir Kabirov on 22.09.2023.
//

import Foundation
import UIKit

class TransitionDIAnimationController: NSObject {
    
    // MARK: - Private Properties
    
    private let animationDuration: Double
    private let animationType: AnimationType
    
    enum AnimationType {
        case present
        case dismiss
    }
    
    // MARK: - Initializer
    
    init(animationDuration: Double, animationType: AnimationType) {
        self.animationDuration = animationDuration
        self.animationType = animationType
    }
    
}

extension TransitionDIAnimationController: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TimeInterval(exactly: animationDuration) ?? 0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let toViewController = transitionContext.viewController(forKey: .to),
              let fromViewController = transitionContext.viewController(forKey: .from) else {
            transitionContext.completeTransition(false)
            return
        }
        
        switch animationType {
        case .present:
            transitionContext.containerView.addSubview(toViewController.view)
            presentAnimation(with: transitionContext, viewToAnimate: toViewController.view)
        case .dismiss:
            print(fromViewController.view.bounds)
            return
        }
    }
    
    func presentAnimation(with transitionContext: UIViewControllerContextTransitioning, viewToAnimate: UIView) {
        
        viewToAnimate.clipsToBounds = true
        let initialFrame = viewToAnimate.frame
        viewToAnimate.frame = CGRect(x: 203, y: 12, width: 0, height: 0)
        viewToAnimate.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        viewToAnimate.layer.cornerRadius = 15
        
        
        let duration = transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0.1,
                       animations: {
            viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
            viewToAnimate.frame = initialFrame
        }) { _ in
            transitionContext.completeTransition(true)
        }
    }
}
