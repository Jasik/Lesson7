//
//  PlaySong.swift
//  iOSArchitecturesDemo
//
//  Created by Vladimir Rogozhkin on 2020/07/11.
//  Copyright © 2020 ekireev. All rights reserved.
//

import Foundation

final class PlaySong {
    enum PlayingState {
        case notPlayed
        case plaing(progress: Double)
        case played
    }
    
    let song: ITunesSong
    var playingState: Observable<PlayingState> = Observable(.notPlayed)
    
    init(song: ITunesSong) {
        self.song = song
    }
}
