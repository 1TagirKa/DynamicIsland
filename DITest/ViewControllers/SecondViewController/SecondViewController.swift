//
//  SecondViewController.swift
//  DITest
//
//  Created by Tagir Kabirov on 21.09.2023.
//

import Foundation
import UIKit
import SnapKit

class SecondViewController: UIViewController {
    
    private lazy var redView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    private lazy var blueView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    
    private lazy var yellowView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        return view
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 32, weight: .semibold)
        label.textColor = .systemBlue
        label.text = "Второй Экран"
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.backgroundColor = .systemBlue
        button.setTitle("Вернуться назад", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupLabel()
        setupConstrains()
        setupButton()
    }
    
    // MARK: - Setup Functions
    
    private func setupLabel() {
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    private func setupConstrains() {
        redView.layer.cornerRadius = 15
        view.addSubview(redView)
        redView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(12)
            make.height.width.equalTo(120)
            make.top.equalToSuperview().inset(100)
        }
        
        blueView.layer.cornerRadius = 15
        view.addSubview(blueView)
        blueView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(110)
            make.height.width.equalTo(150)
            make.top.equalToSuperview().inset(150)
        }
        
        yellowView.layer.cornerRadius = 15
        view.addSubview(yellowView)
        yellowView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(190)
            make.height.width.equalTo(170)
            make.bottom.equalToSuperview().inset(150)
        }
        
        backButton.layer.cornerRadius = 8
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.centerX.equalTo(label)
            make.top.equalTo(label.snp.bottom).inset(-16)
            make.width.equalTo(label)
        }
    }
    
    private func setupButton() {
        backButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc
    private func buttonPressed() {
        dismiss(animated: true)
    }
    
}
