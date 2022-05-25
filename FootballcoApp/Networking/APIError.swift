//
//  APIError.swift
//  FootballcoApp
//
//  Created by sebastianstaszczyk on 25/05/2022.
//

import Foundation

public enum APIError: Error {
    case other(Error)
    case decoding(Error)
    case unknown
}
