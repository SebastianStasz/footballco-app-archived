//
//  GetArticlesListRequest.swift
//  FootballcoApp
//
//  Created by sebastianstaszczyk on 25/05/2022.
//

import Foundation

struct GetArticlesListRequest: APIRequest {

    var method: RequestMethod { .GET }

    var path: String {
        "articles"
    }

    var queryParams: [String: String] {
        ["page": String(page)]
    }

    private let page: Int

    public init(for page: Int) {
        self.page = page
    }
}
