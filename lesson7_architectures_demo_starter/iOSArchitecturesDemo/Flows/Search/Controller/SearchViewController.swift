//
//  ViewController.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 14.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class SearchViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private var searchView: SearchView {
        self.view as! SearchView
    }
    private let presenter: SearchViewOutput
    private let searchService = ITunesSearchService()
    internal var searchResults = [ITunesApp]() {
        didSet {
            self.searchView.tableView.isHidden = false
            self.searchView.tableView.reloadData()
            self.searchView.searchBar.resignFirstResponder()
        }
    }
    
    private struct Constants {
        static let reuseIdentifier = "reuseId"
    }
    
    init(presenter: SearchViewOutput) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = SearchView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "song", style: .plain, target: self, action: #selector(moveToSerchSong))
        
        self.searchView.searchBar.delegate = self
        self.searchView.tableView.register(AppCell.self, forCellReuseIdentifier: Constants.reuseIdentifier)
        self.searchView.tableView.delegate = self
        self.searchView.tableView.dataSource = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.throbber(show: false)
    }
    
    @objc private func moveToSerchSong() {
        let router = SongSearchRouter()
        let interactor = SongSearchInteractor()
        let presenter = SongSearchPresenter(interactor: interactor, router: router)
        let songSearchViewController = SongSearchViewController(presenter: presenter)
        presenter.viewInput = songSearchViewController
        router.viewController = songSearchViewController
        navigationController?.pushViewController(songSearchViewController, animated: true)
    }
}

//MARK: - UITableViewDataSource
extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifier, for: indexPath)
        guard let cell = dequeuedCell as? AppCell else {
            return dequeuedCell
        }
        let app = self.searchResults[indexPath.row]
        let cellModel = AppCellModelFactory.cellModel(from: app)
        cell.configure(with: cellModel)
        
        return cell
    }
}

//MARK: - UITableViewDelegate
extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let app = searchResults[indexPath.row]
        self.presenter.viewDidSelectApp(app)
    }
}

//MARK: - UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    
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

extension SearchViewController: SearchViewInput {
    
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
