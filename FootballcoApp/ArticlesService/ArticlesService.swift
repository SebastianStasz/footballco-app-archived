//
//  ArticlesService.swift
//  FootballcoApp
//
//  Created by sebastianstaszczyk on 25/05/2022.
//

import Foundation

final class ArticlesService {

    private let apiService: APIService

    init(apiService: APIService = .shared) {
        self.apiService = apiService
    }

    func getArticlesList(for page: Int) async throws -> [ArticleModel] {
        try await apiService.execute(GetArticlesListRequest(for: page), type: .articleList)
    }
}
