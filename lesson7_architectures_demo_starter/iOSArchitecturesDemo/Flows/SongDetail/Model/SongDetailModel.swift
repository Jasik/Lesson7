//
//  SongDetailModel.swift
//  iOSArchitecturesDemo
//
//  Created by Vladimir Rogozhkin on 2020/07/11.
//  Copyright © 2020 ekireev. All rights reserved.
//

import Foundation

struct SongDetailModel {
    let artistTitle: String
    let trackTitle: String
    let albumTitle: String
    let songIcon: String
    let playingProgress: Observable<PlaySong.PlayingState>
}
