//
//  AppDetailVersionView.swift
//  iOSArchitecturesDemo
//
//  Created by Vladimir Rogozhkin on 2020/06/28.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

final class AppDetailVersionView: UIView {
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Что нового"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    private(set) lazy var versionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = .boldSystemFont(ofSize: 14)
        return label
    }()
    
    private(set) lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = .boldSystemFont(ofSize: 14)
        label.numberOfLines = 0
        label.lineBreakMode = .byCharWrapping
        return label
    }()
    
    private(set) lazy var historyButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("История версии", for: .normal)
        return button
    }()
    
    private(set) lazy var lastUpdateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = .boldSystemFont(ofSize: 14)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.setupLayouts()
    }
}

private extension AppDetailVersionView {
    
    func setupLayouts() {
        let titleStack_H = UIStackView(arrangedSubviews: [titleLabel, historyButton])
        titleStack_H.translatesAutoresizingMaskIntoConstraints = false
        titleStack_H.spacing = 20
        titleStack_H.axis = .horizontal
        
        let versionStack_H = UIStackView(arrangedSubviews: [versionLabel, lastUpdateLabel])
        versionStack_H.translatesAutoresizingMaskIntoConstraints = false
        versionStack_H.spacing = 20
        versionStack_H.axis = .horizontal
        
        let stack_V = UIStackView(arrangedSubviews: [titleStack_H, versionStack_H])
        stack_V.translatesAutoresizingMaskIntoConstraints = false
        stack_V.spacing = 10
        stack_V.axis = .vertical

        self.addSubview(stack_V)
        self.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            stack_V.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0),
            stack_V.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16.0),
            stack_V.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16.0),
            
            self.descriptionLabel.topAnchor.constraint(equalTo: stack_V.bottomAnchor, constant: 10.0),
            self.descriptionLabel.leftAnchor.constraint(equalTo: stack_V.leftAnchor),
            self.descriptionLabel.rightAnchor.constraint(equalTo: stack_V.rightAnchor)
        ])
    }
}
