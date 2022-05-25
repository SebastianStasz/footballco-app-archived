//
//  TabBarController.swift
//  FootballcoApp
//
//  Created by sebastianstaszczyk on 25/05/2022.
//

import UIKit

final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let newsListVC = NewsListCoordinator().start()
        let matchesListVC = MatchListCoordinator().start()

        newsListVC.tabBarItem = .init(title: "News", image: UIImage(systemName: "newspaper.fill"), tag: 0)
        matchesListVC.tabBarItem = .init(title: "Matches", image: UIImage(systemName: "flag.2.crossed.fill"), tag: 1)

        viewControllers = [newsListVC, matchesListVC]
    }
}
