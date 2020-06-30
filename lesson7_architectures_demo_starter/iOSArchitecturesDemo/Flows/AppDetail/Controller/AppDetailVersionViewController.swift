//
//  AppDetailVersionViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Vladimir Rogozhkin on 2020/06/28.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit
import Foundation

final class AppDetailVersionViewController: UIViewController {
    
    private let app: ITunesApp
    
    private var appDetailVersionView: AppDetailVersionView {
        self.view as! AppDetailVersionView
    }
    
    init(app: ITunesApp) {
        self.app = app
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = AppDetailVersionView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fillData()
    }
}

private extension AppDetailVersionViewController {
    
    func fillData() {
        self.appDetailVersionView.versionLabel.text = "Версия \(app.appVersion)"
        self.appDetailVersionView.lastUpdateLabel.text = app.appCurrentVersionReleaseDate
        self.appDetailVersionView.descriptionLabel.text = app.appReleaseNotes
    }
}
