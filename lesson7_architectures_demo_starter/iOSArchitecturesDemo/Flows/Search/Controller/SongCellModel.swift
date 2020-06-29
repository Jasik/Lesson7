//
//  SongCellModel.swift
//  iOSArchitecturesDemo
//
//  Created by Vladimir Rogozhkin on 2020/06/28.
//  Copyright © 2020 ekireev. All rights reserved.
//

import Foundation

struct SongCellModel {
    let artistTitle: String
    let trackTitle: String
}

extension SongCellModel {
    static func cellModel(form model: ITunesSong) -> SongCellModel {
        return SongCellModel(artistTitle: model.artistName!, trackTitle: model.trackName)
    }
}
