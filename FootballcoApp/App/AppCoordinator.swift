//
//  AppCoordinator.swift
//  FootballcoApp
//
//  Created by sebastianstaszczyk on 25/05/2022.
//

import UIKit

final class AppCoordinator {

    private let window: UIWindow

    init(with window: UIWindow) {
        self.window = window
        window.rootViewController = TabBarController()
    }

    // This coordinator can be used to handle some states and views before main tab bar.
}
