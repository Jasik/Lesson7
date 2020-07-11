//
//  SongSearchRouter.swift
//  iOSArchitecturesDemo
//
//  Created by Vladimir Rogozhkin on 2020/07/08.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

protocol SongSearchRouterInput {
    func openDetails(for song: ITunesSong)
//    func openSongInITunes(_ song: ITunesSong)
}

final class SongSearchRouter: SongSearchRouterInput {
    
    weak var viewController: UIViewController?
    
    func openDetails(for song: ITunesSong) {
        let songDetailViewController = SongDetailViewController(song: song)
        
        self.viewController?.navigationController?.pushViewController(songDetailViewController, animated: true)
    }
    
//    func openSongInITunes(_ song: ITunesSong) {
//        guard let urlString = song.a
//    }
}
