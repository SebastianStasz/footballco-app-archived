//
//  RequestType.swift
//  FootballcoApp
//
//  Created by sebastianstaszczyk on 25/05/2022.
//

import Foundation

enum RequestType: String {
    case articleList = "https://mobile-recruitment.footballco.cloud"

    var baseURL: URL {
        URL(string: rawValue)!
    }
}
