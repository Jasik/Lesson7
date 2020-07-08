//
//  SearchRouter.swift
//  iOSArchitecturesDemo
//
//  Created by Vladimir Rogozhkin on 2020/07/08.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

protocol SearchRouterInput {
    func openDetails(for app: ITunesApp)
    func openAppInITunes(_ app: ITunesApp)
}

final class SearchRouter: SearchRouterInput {
    
    weak var viewController: UIViewController?
    
    func openDetails(for app: ITunesApp) {
        let appDetailViewController = AppDetailViewController(app: app)
        
        self.viewController?.navigationController?.pushViewController(appDetailViewController, animated: true)
    }
    
    func openAppInITunes(_ app: ITunesApp) {
        guard let urlString = app.appUrl, let url = URL(string: urlString) else {
            return
        }
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
