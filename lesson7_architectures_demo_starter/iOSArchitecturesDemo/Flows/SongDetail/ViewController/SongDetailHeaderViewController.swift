//
//  SongDetailHeaderViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Vladimir Rogozhkin on 2020/07/08.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

final class SongDetailHeaderViewController: UIViewController {
    
    private let song: ITunesSong
    private let imageDownloader = ImageDownloader()
    
    private var songDetailHeaderView: SongDetailHeaderView {
        self.view as! SongDetailHeaderView
    }
    
    init(song: ITunesSong) {
        self.song = song
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = SongDetailHeaderView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fillData()
    }
}

private extension SongDetailHeaderViewController {
    
    func fillData() {
        self.downloadImage()
        self.songDetailHeaderView.artistLabel.text = song.artistName
        self.songDetailHeaderView.trackName.text = song.trackName
        self.songDetailHeaderView.albumLabel.text = song.collectionName
    }
    
    func downloadImage() {
        guard let url = self.song.artwork else {
            return
        }
        
        self.imageDownloader.getImage(fromUrl: url) { [weak self] (image, _) in
            self?.songDetailHeaderView.imageView.image = image
        }
    }
}
