//
//  AppDetailHeaderViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Vladimir Rogozhkin on 2020/06/27.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

final class AppDetailHeaderViewController: UIViewController {
    
    private let app: ITunesApp
    private let imageDownloader = ImageDownloader()
    
    private var appDetailHeaderView: AppDetailHeaderView {
        self.view as! AppDetailHeaderView
    }
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = AppDetailHeaderView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fillData()
    }
}

private extension AppDetailHeaderViewController {
    
    func fillData() {
        self.dowloadImage()
        self.appDetailHeaderView.titleLabel.text = app.appName
        self.appDetailHeaderView.subTitleLabel.text = app.company
        self.appDetailHeaderView.ratingLabel.text = app.averageRating >>- { "\($0)" }
    }
    
    func dowloadImage() {
        guard let url = self.app.iconUrl else {
            return
        }
        
        self.imageDownloader.getImage(fromUrl: url) { [weak self] (image, _) in
            self?.appDetailHeaderView.imageView.image = image
        }
    }
}
