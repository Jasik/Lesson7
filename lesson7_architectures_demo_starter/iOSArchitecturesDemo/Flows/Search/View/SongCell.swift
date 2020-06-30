//
//  SongCell.swift
//  iOSArchitecturesDemo
//
//  Created by Vladimir Rogozhkin on 2020/06/28.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

final class SongCell: UITableViewCell {
    
    private let noteImage: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "musical-note"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .gray
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
    
    private(set) lazy var trackLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.font = .boldSystemFont(ofSize: 15.0)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.configureUI()
    }
    
    override func prepareForReuse() {
        [self.artistLabel, self.trackLabel].forEach { $0.text = nil }
    }
}

extension SongCell {
    func configure(with cellModel: SongCellModel) {
        self.artistLabel.text = cellModel.artistTitle
        self.trackLabel.text = cellModel.trackTitle
    }
}

private extension SongCell {
    
    func configureUI() {
        let stackView = UIStackView(arrangedSubviews: [artistLabel, trackLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8.0
        stackView.axis = .vertical
        
        self.contentView.addSubview(noteImage)
        self.contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            self.noteImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.noteImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 8.0),
            self.noteImage.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.9),
            self.noteImage.widthAnchor.constraint(equalTo: noteImage.heightAnchor),
            
            stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0),
            stackView.leftAnchor.constraint(equalTo: noteImage.rightAnchor, constant: 10.0),
            stackView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -8.0),
            stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8.0)
        ])
    }
}
