//
//  SearchModuleBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Vladimir Rogozhkin on 2020/06/28.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

final class SearchModuleBuilder {
    
    static func build() -> (UIViewController & SearchViewInput) {
        let router = SearchRouter()
        let interactor = SearchInteractor()
        let presenter = SearchPresenter(interactor: interactor, router: router)
        let viewController = SearchViewController(presenter: presenter)
        presenter.viewInput = viewController
        router.viewController = viewController
        return viewController
    }
}
