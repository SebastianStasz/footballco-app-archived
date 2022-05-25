//
//  ViewModel.swift
//  FootballcoApp
//
//  Created by sebastianstaszczyk on 25/05/2022.
//

import Combine
import Foundation

class ViewModel: ObservableObject {

    private let coordinator: CoordinatorProtocol?
    var cancellables: Set<AnyCancellable> = []

    init(coordinator: CoordinatorProtocol? = nil) {
        self.coordinator = coordinator
    }

    func viewDidLoad() {}
}
