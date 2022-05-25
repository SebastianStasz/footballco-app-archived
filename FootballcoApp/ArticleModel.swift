//
//  ArticleModel.swift
//  FootballcoApp
//
//  Created by sebastianstaszczyk on 25/05/2022.
//

import Foundation

struct ArticleModel: Identifiable, Decodable {
    let id: String
    let publishedTime: Double
    let headline: String
    let body: String
    let imageUrl: String
}
