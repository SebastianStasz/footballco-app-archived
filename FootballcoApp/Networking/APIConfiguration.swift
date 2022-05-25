//
//  APIConfigurationProtocol.swift
//  FootballcoApp
//
//  Created by sebastianstaszczyk on 25/05/2022.
//

import Foundation

public protocol APIConfigurationProtocol {
    var decoder: JSONDecoder { get }
    var encoder: JSONEncoder { get }
}

public struct APIConfiguration: APIConfigurationProtocol {
    public let decoder = JSONDecoder()
    public let encoder = JSONEncoder()

    public init() {}
}
