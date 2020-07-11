//
//  PlaySongsServiceInterface.swift
//  iOSArchitecturesDemo
//
//  Created by Vladimir Rogozhkin on 2020/07/11.
//  Copyright © 2020 ekireev. All rights reserved.
//

import Foundation

protocol PlaySongsServiceInterface: class {
    var playingSongs: [PlaySong] { get }
    var onProgressUpdate: (() -> Void)? { get set }
    func startPlaySong(_ song: ITunesSong)
}
