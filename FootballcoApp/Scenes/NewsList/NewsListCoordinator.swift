//
//  NewsListCoordinator.swift
//  FootballcoApp
//
//  Created by sebastianstaszczyk on 25/05/2022.
//

import UIKit
import SwiftUI

final class NewsListCoordinator: CoordinatorProtocol {

    enum Destination {
        case newsDetails(for: Article)
    }

    private let navigationController = UINavigationController()

    func start() -> UIViewController {
        let viewModel = NewsListVM(coordinator: self)
        let view = NewsListView(viewModel: viewModel)
        let viewController = SwiftUIVC(viewModel: viewModel, view: view)
        navigationController.viewControllers = [viewController]

        viewModel.binding.navigateTo
            .sink { [weak self] in self?.navigate(to: $0) }
            .store(in: &viewModel.cancellables)

        return navigationController
    }
}

private extension NewsListCoordinator {

    func navigate(to destination: Destination) {
        switch destination {
        case .newsDetails(let article):
            presentNewsDetails(for: article)
        }
    }

    func presentNewsDetails(for article: Article) {
        let viewModel = NewsDetailsVM(coordinator: self, article: article)
        let view = NewsDetailsView(viewModel: viewModel)
        let viewController = SwiftUIVC(viewModel: viewModel, view: view)
        navigationController.pushViewController(viewController, animated: true)
    }
}
