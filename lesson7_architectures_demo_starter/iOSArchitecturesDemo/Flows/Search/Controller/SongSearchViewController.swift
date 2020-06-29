//
//  SongSearchViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Vladimir Rogozhkin on 2020/06/28.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

final class SongSearchViewController: UIViewController {
    
    private var searchView: SearchView {
        self.view as! SearchView
    }
    private let presenter: SongSearchViewOutput
    private let searchService = ITunesSearchService()
    var searchResults = [ITunesSong]() {
        didSet {
            self.searchView.tableView.isHidden = false
            self.searchView.tableView.reloadData()
            self.searchView.searchBar.resignFirstResponder()
        }
    }
    
    private struct Constants {
        static let reuseIdentifier = "reuseId"
    }
    
    init(presenter: SongSearchViewOutput) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = SearchView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Song search"
        
        self.searchView.searchBar.delegate = self
        self.searchView.tableView.delegate = self
        self.searchView.tableView.dataSource = self
        
        self.searchView.tableView.register(SongCell.self, forCellReuseIdentifier: Constants.reuseIdentifier)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.throbber(show: false)
    }
}

extension SongSearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifier, for: indexPath) as? SongCell else {
            fatalError()
        }
        
        let song = self.searchResults[indexPath.row]
        let cellModel = SongCellModel.cellModel(form: song)
        cell.configure(with: cellModel)
        
        return cell
    }
}

extension SongSearchViewController: UITableViewDelegate {
    
}

extension SongSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else {
            searchBar.resignFirstResponder()
            return
        }
        if query.count == 0 {
            searchBar.resignFirstResponder()
            return
        }
        self.presenter.viewDidSearch(with: query)
    }
}

extension SongSearchViewController: SongSearchViewInput {
    
    func showError(error: Error) {
        let alert = UIAlertController(title: "Error", message: "\(error.localizedDescription)", preferredStyle: .alert)
        let actionOK = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(actionOK)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showNoResults() {
        self.searchView.emptyResultView.isHidden = false
        self.searchResults = []
        self.searchView.tableView.reloadData()
    }
    
    func hideNoResults() {
        self.searchView.emptyResultView.isHidden = true
    }
    
    func throbber(show: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = show
    }
}
