//
//  MatchListCoordinator.swift
//  FootballcoApp
//
//  Created by sebastianstaszczyk on 25/05/2022.
//

import UIKit

final class MatchListCoordinator: CoordinatorProtocol {

    func start() -> UIViewController {
        let viewModel = MatchListVM(coordinator: self)
        let view = MatchListView(viewModel: viewModel)
        let viewController = SwiftUIVC(viewModel: viewModel, view: view)
        return viewController
    }
}
