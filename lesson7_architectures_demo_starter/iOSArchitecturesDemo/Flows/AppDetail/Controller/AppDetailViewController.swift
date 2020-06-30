//
//  AppDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 20.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppDetailViewController: UIViewController {
    
    let app: ITunesApp
    
    lazy var headerViewController = AppDetailHeaderViewController(app: self.app)
    lazy var versionViewController = AppDetailVersionViewController(app: self.app)
    
    init(app: ITunesApp) {
        self.app = app
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureUI()
    }
}

private extension AppDetailViewController {
    
    func configureUI() {
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationItem.largeTitleDisplayMode = .never
        self.addHeaderViewController()
        self.addVersionViewController()
//        self.addDescriptionViewController()
    }
    
    func addHeaderViewController() {
        
        guard let headerView = self.headerViewController.view else { return }
        
        self.addChild(self.headerViewController)
        self.view.addSubview(headerView)
        self.headerViewController.didMove(toParent: self)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            headerView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
    }
    
    func addVersionViewController() {
        
        guard let versionView  = self.versionViewController.view else { return }
        
        self.addChild(self.versionViewController)
        self.view.addSubview(versionView)
        self.versionViewController.didMove(toParent: self)
        
        versionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            versionView.topAnchor.constraint(equalTo: self.headerViewController.view.bottomAnchor),
            versionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            versionView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            versionView.heightAnchor.constraint(equalToConstant: 250.0)
        ])
    }
    
//    func addDescriptionViewController() {
//
//        let descriptionViewController = UIViewController()
//        guard let descriptionView = descriptionViewController.view else { return }
//
//        self.addChild(descriptionViewController)
//        self.view.addSubview(descriptionView)
//        descriptionViewController.didMove(toParent: self)
//
//        descriptionView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            descriptionView.topAnchor.constraint(equalTo: self.headerViewController.view.bottomAnchor),
//            descriptionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
//            descriptionView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
//            descriptionView.heightAnchor.constraint(equalToConstant: 250.0)
//        ])
//    }
}
