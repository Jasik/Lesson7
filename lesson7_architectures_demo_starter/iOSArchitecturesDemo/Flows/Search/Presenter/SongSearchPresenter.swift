//
//  SongSearchPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Vladimir Rogozhkin on 2020/06/29.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

protocol SongSearchViewInput: class {
    var searchResults: [ITunesSong] { get set }
    
    func showError(error: Error)
    func showNoResults()
    func hideNoResults()
    func throbber(show: Bool)
}

protocol SongSearchViewOutput: class {
    func viewDidSearch(with query: String)
    func viewDidSelectSong(_ song: ITunesSong)
}

final class SongSearchPresenter {
    weak var viewInput: (UIViewController & SongSearchViewInput)?
    
    private let searchService = ITunesSearchService()
    
    let interactor: SongSearchInteractor
    let router: SongSearchRouter
    
    init(interactor: SongSearchInteractor, router: SongSearchRouter){
        self.interactor = interactor
        self.router = router
    }
}

private extension SongSearchPresenter {
    
    func requestSongs(with query: String) {
        self.searchService.getSongs(forQuery: query) { [weak self] result in
            guard let self = self else { return }
            self.viewInput?.throbber(show: false)
            result
                .withValue { songs in
                    guard !songs.isEmpty else {
                        self.viewInput?.showNoResults()
                        return
                    }
                    
                    self.viewInput?.hideNoResults()
                    self.viewInput?.searchResults = songs
                }
                .withError {
                    self.viewInput?.showError(error: $0)
                }
        }
    }
}

extension SongSearchPresenter: SongSearchViewOutput {
    
    func viewDidSearch(with query: String) {
        self.viewInput?.throbber(show: true)
        self.requestSongs(with: query)
    }
    
    func viewDidSelectSong(_ song: ITunesSong) {
        self.router.openDetails(for: song)
    }
}
