//
//  NewsListVM.swift
//  FootballcoApp
//
//  Created by sebastianstaszczyk on 25/05/2022.
//

import Combine
import Foundation

final class NewsListVM: ViewModel {

    struct Binding {
        let loadMore = PassthroughSubject<Void, Never>()
    }

    @Published private(set) var articles: [Article] = []
    @Published private(set) var isMorePages = false
    @Published private(set) var isLoading = false

    private var currentPage = 1
    private let service: ArticlesService

    let binding = Binding()

    init(coordinator: CoordinatorProtocol?, service: ArticlesService = .init()) {
        self.service = service
        super.init(coordinator: coordinator)
    }

    override func viewDidLoad() {
        let isLoading = PassthroughSubject<Bool, Never>()
        let errorTracker = PassthroughSubject<Error, Never>()

        isLoading
            .filter { [weak self] _ in
                !(self?.isMorePages ?? true)
            }
            .assign(to: &$isLoading)

        Publishers.Merge(Just(()), binding.loadMore)
            .perform(on: self, isLoading: isLoading, errorTracker: errorTracker) { vm, _ in
                try await vm.service.getArticlesList(for: vm.currentPage)
            }
            .map { $0.map { Article(from: $0) } }
            .sinkAndStore(on: self, action: { vm, articles in
                vm.currentPage += 1
                vm.articles.append(contentsOf: articles)
                vm.isMorePages = !articles.isEmpty
            })
    }
}
