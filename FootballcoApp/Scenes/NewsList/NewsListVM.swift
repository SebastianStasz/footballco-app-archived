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
        let navigateTo = PassthroughSubject<NewsListCoordinator.Destination, Never>()
        let loadMore = PassthroughSubject<Void, Never>()
        let refresh = PassthroughSubject<Void, Never>()
    }

    @Published private(set) var articles: [Article] = []
    @Published private(set) var isMorePages = false
    @Published private(set) var isLoading = false

    private var currentPage = 1
    private let service: ArticlesServiceProtocol

    let binding = Binding()

    init(coordinator: CoordinatorProtocol?,
         service: ArticlesServiceProtocol = ArticlesService()
    ) {
        self.service = service
        super.init(coordinator: coordinator)
    }

    override func viewDidLoad() {
        let isLoading = PassthroughSubject<Bool, Never>()
        let errorTracker = PassthroughSubject<Error, Never>()

        binding.navigateTo
            .sinkAndStore(on: self) { vm, destination in
                if case let .newsDetails(article) = destination,
                   let index = vm.articles.firstIndex(where: { $0.id == article.id }) {
                    vm.articles[index].didOpenArticle()
                }
            }

        isLoading
            .filter { [weak self] _ in
                !(self?.isMorePages ?? true)
            }
            .assign(to: &$isLoading)

        let refresh = binding.refresh
            .onNext(on: self, perform: { vm, _ in
                vm.isMorePages = false
                vm.currentPage = 1
                vm.articles = []
            })

        Publishers.Merge3(Just(()), binding.loadMore, refresh)
            .perform(on: self, isLoading: isLoading, errorTracker: errorTracker) { vm, _ in
                try await vm.service.getArticles(for: vm.currentPage)
            }
            .map { $0.map { Article(from: $0) } }
            .sinkAndStore(on: self, action: { vm, articles in
                vm.currentPage += 1
                vm.articles.append(contentsOf: articles)
                vm.isMorePages = !articles.isEmpty
            })
    }
}
