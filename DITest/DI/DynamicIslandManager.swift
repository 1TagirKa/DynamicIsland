//
//  DynamicIslandManager.swift
//  DITest
//
//  Created by Tagir Kabirov on 18.09.2023.
//

import Foundation
import UIKit

enum DynamicIslandAnimationType {
    case pulse
    case twitching
    case jumping
    case turns
    case falling
}

enum DynamicIslandLoadingType {
    case basicRight
}

enum DynamicIslandViewAnimationType {
    case suction
    case throwingOut
    case wavy
}

class DynamicIslandManager {
    
    // MARK: - Properties
    
    var animator: Animator?
    var dynamicIslandView: UIView = UIView()
    
    // MARK: - Private Properties
    
    private var loaderType: DynamicIslandLoadingType?
    private var loader = UIActivityIndicatorView()
    
    init(to vc: UIViewController) {
        setupDynamicIsland(to: vc.view)
        dynamicIslandView.backgroundColor = .black
    }
    
    // MARK: - Functions
    
    func animateView(_ view: UIView, withType animationType: DynamicIslandViewAnimationType) {
        switch animationType {
        case .suction:
            viewSuctionAnimation(view)
        case .throwingOut:
            viewThrowingOutAnimation(view)
        case .wavy:
            viewWavyAnimation(view)
        }
    }
    
    func setLogo(logo: UIImage? = nil,
                 title: String? = nil,
                 textColor: UIColor? = nil) {
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        if let logo = logo {
            let logoImageView = UIImageView(image: logo)
            logoImageView.contentMode = .scaleAspectFill
            logoImageView.clipsToBounds = true
            logoImageView.layer.cornerRadius = 4
            NSLayoutConstraint.activate([
                logoImageView.heightAnchor.constraint(equalToConstant: 14),
                logoImageView.widthAnchor.constraint(equalToConstant: 14)
            ])
            stackView.addArrangedSubview(logoImageView)
        }
        
        if let title = title {
            let label = UILabel()
            label.text = title
            label.font = .systemFont(ofSize: 16, weight: .bold)
            label.textColor = textColor
            stackView.addArrangedSubview(label)
            if logo == nil { label.textAlignment = .center}
        }
        
        dynamicIslandView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: dynamicIslandView.topAnchor, constant: 4),
            stackView.bottomAnchor.constraint(equalTo: dynamicIslandView.bottomAnchor, constant: -4),
            stackView.leadingAnchor.constraint(equalTo: dynamicIslandView.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: dynamicIslandView.trailingAnchor, constant: 8)
        ])
    }
    
    func changeColor(_ color: UIColor) {
        dynamicIslandView.backgroundColor = color
    }
    
    func addLoading(_ type: DynamicIslandLoadingType) {
        loaderType = type
        switch type {
        case .basicRight:
            startBasicLoading()
        }
    }
    
    func addAnimation(_ type: DynamicIslandAnimationType) {
        switch type {
        case .pulse:
            pulseAnimation()
        case .twitching:
            twitchingAnimation()
        case .jumping:
            jumpingAnimation()
        case .turns:
            turnsAnimation()
        case .falling:
            fallingAnimation()
        }
    }
    
    func stopAnimation() {
        dynamicIslandView.layer.removeAnimation(forKey: "pulseAnimation")
    }
    
    func stopLoading() {
        guard let type = loaderType else { return }
        switch type {
        case .basicRight:
            stopBasicLoading()
        }
    }
    
    // MARK: - Private Functions
    
    //Animations
    
    private func pulseAnimation() {
        
        let transformAnimation = CABasicAnimation(keyPath: "transform.scale")
        transformAnimation.fromValue = 1.0
        transformAnimation.toValue = 1.1
        transformAnimation.duration = 0.5
        transformAnimation.repeatCount = .infinity
        transformAnimation.autoreverses = true
        
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 1.0
        opacityAnimation.toValue = 0.7
        opacityAnimation.duration = 0.5
        opacityAnimation.repeatCount = .infinity
        opacityAnimation.autoreverses = true
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [transformAnimation, opacityAnimation]
        animationGroup.duration = 1
        animationGroup.repeatCount = .infinity
        
        dynamicIslandView.layer.add(animationGroup, forKey: "pulseAnimation")
    }
    
    private func twitchingAnimation() {
        let transformAnimation = CABasicAnimation(keyPath: "transform.scale")
        transformAnimation.fromValue = 1.0
        transformAnimation.toValue = 1.1
        transformAnimation.duration = 0.5
        transformAnimation.repeatCount = .infinity
        transformAnimation.autoreverses = true
        
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 1.0
        opacityAnimation.toValue = 0.7
        opacityAnimation.duration = 0.5
        opacityAnimation.repeatCount = .infinity
        opacityAnimation.autoreverses = true
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [transformAnimation, opacityAnimation]
        animationGroup.duration = 1
        animationGroup.repeatCount = .infinity
        
        dynamicIslandView.layer.add(animationGroup, forKey: "pulseAnimation")
    }
    
    private func jumpingAnimation() {
        let transformAnimation = CABasicAnimation(keyPath: "transform.scale")
        transformAnimation.fromValue = 1.0
        transformAnimation.toValue = 1.1
        transformAnimation.duration = 0.5
        transformAnimation.repeatCount = .infinity
        transformAnimation.autoreverses = true
        
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 1.0
        opacityAnimation.toValue = 0.7
        opacityAnimation.duration = 0.5
        opacityAnimation.repeatCount = .infinity
        opacityAnimation.autoreverses = true
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [transformAnimation, opacityAnimation]
        animationGroup.duration = 1
        animationGroup.repeatCount = .infinity
        
        dynamicIslandView.layer.add(animationGroup, forKey: "pulseAnimation")
    }
    
    private func turnsAnimation() {
        let transformAnimation = CABasicAnimation(keyPath: "transform.scale")
        transformAnimation.fromValue = 1.0
        transformAnimation.toValue = 1.1
        transformAnimation.duration = 0.5
        transformAnimation.repeatCount = .infinity
        transformAnimation.autoreverses = true
        
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 1.0
        opacityAnimation.toValue = 0.7
        opacityAnimation.duration = 0.5
        opacityAnimation.repeatCount = .infinity
        opacityAnimation.autoreverses = true
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [transformAnimation, opacityAnimation]
        animationGroup.duration = 1
        animationGroup.repeatCount = .infinity
        
        dynamicIslandView.layer.add(animationGroup, forKey: "pulseAnimation")
    }
    
    private func fallingAnimation() {
        let transformAnimation = CABasicAnimation(keyPath: "transform.scale")
        transformAnimation.fromValue = 1.0
        transformAnimation.toValue = 1.1
        transformAnimation.duration = 0.5
        transformAnimation.repeatCount = .infinity
        transformAnimation.autoreverses = true
        
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 1.0
        opacityAnimation.toValue = 0.7
        opacityAnimation.duration = 0.5
        opacityAnimation.repeatCount = .infinity
        opacityAnimation.autoreverses = true
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [transformAnimation, opacityAnimation]
        animationGroup.duration = 1
        animationGroup.repeatCount = .infinity
        
        dynamicIslandView.layer.add(animationGroup, forKey: "pulseAnimation")
    }
    //Loading
    
    private func startBasicLoading() {
        dynamicIslandView.addSubview(loader)
        
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.color = .white
        
        NSLayoutConstraint.activate([
            loader.centerYAnchor.constraint(equalTo: dynamicIslandView.centerYAnchor),
            loader.trailingAnchor.constraint(equalTo: dynamicIslandView.trailingAnchor, constant: -8),
            loader.heightAnchor.constraint(equalToConstant: 16),
            loader.widthAnchor.constraint(equalToConstant: 16)
        ])
        
        UIView.animate(withDuration: 1, animations: {
            var frame = self.dynamicIslandView.frame
            frame.origin.x += 27
            self.dynamicIslandView.frame = frame
        }) { _ in
            self.loader.startAnimating()
        }
    }
    
    private func stopBasicLoading() {
        UIView.animate(withDuration: 1, animations: {
            var frame = self.dynamicIslandView.frame
            frame.origin.x -= 27
            self.dynamicIslandView.frame = frame
        }) { _ in
            self.loader.stopAnimating()
        }
    }
    
    //View Animation
    
    private func viewSuctionAnimation(_ view: UIView) {
        UIView.animate(withDuration: 1.0, animations: { [weak self] in
            guard let self = self else { return }
            view.frame = self.dynamicIslandView.frame
            view.alpha = 0
        })

    }
    
    private func viewThrowingOutAnimation(_ view: UIView) {
        UIView.animate(withDuration: 1.0, animations: { [weak self] in
            guard let self = self else { return }
            view.transform = CGAffineTransform(translationX: self.dynamicIslandView.frame.minX,
                                               y: self.dynamicIslandView.frame.minY)
        })

    }
    
    private func viewWavyAnimation(_ view: UIView) {
        UIView.animate(withDuration: 1.0, animations: { [weak self] in
            guard let self = self else { return }
            view.transform = CGAffineTransform(translationX: self.dynamicIslandView.frame.minX,
                                               y: self.dynamicIslandView.frame.minY)
        })

    }
    
    // MARK: - Setup Functions
    
    private func setupDynamicIsland(to view: UIView) {
        dynamicIslandView = UIView(frame: setConstraints())
        dynamicIslandView.layer.cornerRadius = 18
        view.addSubview(dynamicIslandView)
    }
    
    private func setConstraints() -> CGRect {
        let screenBounds = UIScreen.main.bounds
        let screenWidth = screenBounds.size.width
        print(screenWidth)
        
        return CGRect(x: screenWidth/2 - 62,
                      y: 11.5,
                      width: 124,
                      height: 36.5)
    }
}
