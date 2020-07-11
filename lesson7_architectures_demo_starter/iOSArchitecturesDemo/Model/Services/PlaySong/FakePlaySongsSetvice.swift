//
//  FakePlaySongsSetvice.swift
//  iOSArchitecturesDemo
//
//  Created by Vladimir Rogozhkin on 2020/07/11.
//  Copyright © 2020 ekireev. All rights reserved.
//

import Foundation

final class FakePlaySongsSetvice: PlaySongsServiceInterface {
    
    private(set) var playingSongs: [PlaySong] = []
    private var timers: [Timer] = []
    var onProgressUpdate: (() -> Void)?
    
    func startPlaySong(_ song: ITunesSong) {
        let playingSong = PlaySong(song: song)
        if !self.playingSongs.contains(where: { $0.song.artistName == song.artistName }) {
            self.playingSongs.append(playingSong)
            self.startTimer(for: playingSong)
        }
    }
    
    private func startTimer(for playingSong: PlaySong) {
        let timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { [weak self] timer in
            switch playingSong.playingState.value {
            case .notPlayed:
                playingSong.playingState.value = .plaing(progress: 0.05)
            case .plaing(let progress):
                let newProgress = progress + 0.05
                if newProgress >= 1 {
                    playingSong.playingState.value = .played
                    self?.invalidateTimer(timer)
                } else {
                    playingSong.playingState.value = .plaing(progress: progress + 0.05)
                }
            case .played:
                self?.invalidateTimer(timer)
            }
            self?.onProgressUpdate?()
        }
        RunLoop.main.add(timer, forMode: .common)
        self.timers.append(timer)
    }
    
    private func invalidateTimer(_ timer: Timer) {
        timer.invalidate()
        self.timers.removeAll { $0 === timer }
    }
}
