//
//  SongDetailControlView.swift
//  iOSArchitecturesDemo
//
//  Created by Vladimir Rogozhkin on 2020/07/09.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

final class SongDetailControlView: UIView {
    
    private(set) lazy var playButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "play"), for: .normal)
        return button
    }()
    
    private(set) lazy var progressBar: UIProgressView = {
        let view = UIProgressView(progressViewStyle: .bar)
        view.trackTintColor = .lightGray
        view.tintColor = .blue
        view.setProgress(0.5, animated: true)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.setupLayout()
    }
}

private extension SongDetailControlView {
    
    func setupLayout() {
        self.addSubview(playButton)
        self.addSubview(progressBar)
        
        NSLayoutConstraint.activate([
            self.playButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12.0),
            self.playButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16.0),
            self.playButton.widthAnchor.constraint(equalToConstant: 40.0),
            self.playButton.heightAnchor.constraint(equalToConstant: 40.0),
            self.playButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            self.progressBar.leftAnchor.constraint(equalTo: self.playButton.rightAnchor, constant: 10.0),
            self.progressBar.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16.0),
            self.progressBar.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
