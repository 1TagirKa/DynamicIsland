//
//  Animator.swift
//  DITest
//
//  Created by Tagir Kabirov on 21.09.2023.
//

import Foundation
import UIKit

enum PresentationType {

    case present
    case dismiss

    var isPresenting: Bool {
        return self == .present
    }
}

final class Animator: NSObject, UIViewControllerAnimatedTransitioning {

    static let duration: TimeInterval = 1.25

    private let type: PresentationType
    private let firstViewController: ViewController
    private let secondViewController: SecondViewController
    private let diView: UIView

    init?(type: PresentationType, firstViewController: ViewController,
          secondViewController: SecondViewController, diView: UIView) {
        self.type = type
        self.firstViewController = firstViewController
        self.secondViewController = secondViewController
        self.diView = diView

        guard (firstViewController.view.window ?? secondViewController.view.window) != nil
            else { return nil }
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return Self.duration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // B2 - 18
        let containerView = transitionContext.containerView

        // B2 - 19
        guard let toView = secondViewController.view
            else {
                transitionContext.completeTransition(false)
                return
        }

        containerView.addSubview(toView)
        
        guard let window = firstViewController.view.window ?? secondViewController.view.window
        else {
            transitionContext.completeTransition(true)
            return
        }
        
        let diRect =  diView.convert(diView.bounds, to: window)
        
        let viewSnapshot: UIView = diView
        
        UIView.animateKeyframes(withDuration: Self.duration, delay: 0, options: .calculationModeCubic, animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                    // B3 - 28
                    viewSnapshot.frame = diRect
                }
            }, completion: { _ in
                // B3 - 29
                viewSnapshot.removeFromSuperview()

                // B3 - 30
                toView.alpha = 1

                // B3 - 31
                transitionContext.completeTransition(true)
            })

    }
}
