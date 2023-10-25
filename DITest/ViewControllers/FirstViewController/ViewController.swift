//
//  ViewController.swift
//  DITest
//
//  Created by Tagir Kabirov on 12.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    var animator: Animator?
    var dynamicManager: DynamicIslandManager?
    var isStartAnimate: Bool = false
    
    // MARK: - Private Properties
    
    private lazy var presentSecondButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.setTitle("Переход", for: .normal)
        return button
    }()
    
    private lazy var presentAnimationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.setTitle("Анимация", for: .normal)
        return button
    }()
    
    private lazy var viewForAnimate: UIView = {
        let view = UIView(frame: CGRect(x: 50, y: 150, width: 170, height: 170))
        view.backgroundColor = .systemBlue
        return view
    }()
    
    private lazy var labelToView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .white
        label.text = "Анимация для view"
        return label
    }()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray2
        setupDynamicIslandManager()
        setupButton()
        setupAnimationButton()
        setupViewForAnimate()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    // MARK: - Setup Functions
    
    private func setupDynamicIslandManager() {
        let dynamicManager = DynamicIslandManager(to: self)
        self.dynamicManager = dynamicManager
        animator = dynamicManager.animator
        dynamicManager.changeColor(.yellow)
        dynamicManager.setLogo(title: "MyLogo",textColor: .black)
    }
    
    private func setupButton() {
        presentSecondButton.addTarget(self, action: #selector(presentSecondViewController), for: .touchUpInside)
        
        view.addSubview(presentSecondButton)
        NSLayoutConstraint.activate([
            presentSecondButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            presentSecondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentSecondButton.heightAnchor.constraint(equalToConstant: 50),
            presentSecondButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            presentSecondButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32)
        ])
    }
    
    private func setupAnimationButton() {
        view.addSubview(presentAnimationButton)
        
        presentAnimationButton.snp.makeConstraints { make in
            make.centerX.height.width.equalTo(presentSecondButton)
            make.top.equalTo(presentSecondButton.snp.bottom).inset(-32)
        }
    }
    
    private func setupViewForAnimate() {
        viewForAnimate.layer.cornerRadius = 8
        
        view.addSubview(viewForAnimate)
        
        viewForAnimate.addSubview(labelToView)
        
        labelToView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        viewForAnimate.addGestureRecognizer(tapGesture)
    }
    
    // MARK: - Private Functions
    
    @objc
    private func viewTapped() {
        dynamicManager?.animateView(viewForAnimate, withType: .suction)
    }
    
    @objc
    private func presentSecondViewController() {
        let secondVC = SecondViewController()
        secondVC.transitioningDelegate = self
        secondVC.modalPresentationStyle = .fullScreen
        
        present(secondVC,animated: true)
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TransitionDIAnimationController(animationDuration: 3.5,
                                               animationType: .present)
    }
    
}
