//
//  NewsListCoordinator.swift
//  FootballcoApp
//
//  Created by sebastianstaszczyk on 25/05/2022.
//

import UIKit

final class NewsListCoordinator: CoordinatorProtocol {

    private let navigationController = UINavigationController()

    func start() -> UIViewController {
        let viewModel = NewsListVM(coordinator: self)
        let view = NewsListView(viewModel: viewModel)
        let viewController = SwiftUIVC(viewModel: viewModel, view: view)
        navigationController.viewControllers = [viewController]
        navigationController.navigationBar.prefersLargeTitles = true
        return navigationController
    }
}
