//
//  TURepositoriesResponse.swift
//  TestUndabotRXSwift
//
//  Created by Filip Varda on 19.02.2023..
//

import Foundation

struct TURepositoriesResponse: Codable {
    let totalCount: Int
    let items: [TURepository]

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case items
    }
}
