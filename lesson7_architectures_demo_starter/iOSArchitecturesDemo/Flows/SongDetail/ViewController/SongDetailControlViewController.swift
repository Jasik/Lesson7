//
//  SongDetailControlViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Vladimir Rogozhkin on 2020/07/11.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

final class SongDetailControlViewController: UIViewController {
    
    private var songDetailControlView: SongDetailControlView {
        self.view as! SongDetailControlView
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = SongDetailControlView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

private extension SongDetailControlViewController {
    
}
