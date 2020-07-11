//
//  SongDetailHeaderView.swift
//  iOSArchitecturesDemo
//
//  Created by Vladimir Rogozhkin on 2020/07/08.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

final class SongDetailHeaderView: UIView {

    private(set) lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 30.0
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private(set) lazy var artistLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    private(set) lazy var trackName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 16.0)
        return label
    }()
    
    private(set) lazy var albumLabel: UILabel = {
         let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.textColor = .lightGray
         label.font = .systemFont(ofSize: 16.0)
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

private extension SongDetailHeaderView {
    
    func setupLayouts() {
        self.addSubview(imageView)
        self.addSubview(artistLabel)
        self.addSubview(trackName)
        self.addSubview(albumLabel)
        
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12.0),
            self.imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6),
            self.imageView.heightAnchor.constraint(equalTo: self.imageView.widthAnchor),
            
            self.artistLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 12.0),
            self.artistLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12.0),
            self.artistLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12.0),
            
            self.trackName.topAnchor.constraint(equalTo: self.artistLabel.bottomAnchor, constant: 8.0),
            self.trackName.leftAnchor.constraint(equalTo: self.artistLabel.leftAnchor),
            self.trackName.rightAnchor.constraint(equalTo: self.artistLabel.rightAnchor),
            
            self.albumLabel.topAnchor.constraint(equalTo: self.trackName.bottomAnchor, constant: 12.0),
            self.albumLabel.leftAnchor.constraint(equalTo: self.artistLabel.leftAnchor),
            self.albumLabel.rightAnchor.constraint(equalTo: self.artistLabel.rightAnchor)
        ])
    }
}
