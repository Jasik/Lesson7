//
//  SongSearchInteractor.swift
//  iOSArchitecturesDemo
//
//  Created by Vladimir Rogozhkin on 2020/07/09.
//  Copyright © 2020 ekireev. All rights reserved.
//

import Alamofire

protocol SongSearchInteractorInput {
    func requestSongs(with query: String, completion: @escaping(Result<[ITunesSong]>) -> Void)
}

final class SongSearchInteractor: SongSearchInteractorInput {
    private let searchService = ITunesSearchService()
    
    func requestSongs(with query: String, completion: @escaping (Result<[ITunesSong]>) -> Void) {
        self.searchService.getSongs(forQuery: query, completion: completion)
    }
}
