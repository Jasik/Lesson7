//
//  SongDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Vladimir Rogozhkin on 2020/07/08.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

final class SongDetailViewController: UIViewController {
    
    let song: ITunesSong
    
    lazy var headerViewController = SongDetailHeaderViewController(song: self.song)
    lazy var controlViewController = SongDetailControlViewController()
    
    init(song: ITunesSong) {
        self.song = song
        
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

private extension SongDetailViewController {
    func configureUI() {
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationItem.largeTitleDisplayMode = .never
        
        self.addHeaderViewController()
        self.addControlViewController()
    }
    
    func addHeaderViewController() {
        guard let headerView = headerViewController.view else { return }
        
        self.addChild(headerViewController)
        self.view.addSubview(headerView)
        self.headerViewController.didMove(toParent: self)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
    
    func addControlViewController() {
        guard let controlView = controlViewController.view else { return }
        
        self.addChild(controlViewController)
        self.view.addSubview(controlView)
        self.controlViewController.didMove(toParent: self)
        
        controlView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            controlView.topAnchor.constraint(equalTo: self.headerViewController.view.bottomAnchor),
            controlView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            controlView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
    }
}
