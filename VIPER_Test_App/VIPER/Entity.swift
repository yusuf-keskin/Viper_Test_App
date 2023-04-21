//
//  Entity.swift
//  VIPER_Test_App
//
//  Created by YUSUF KESKİN on 21.04.2023.
//

import Foundation

// MARK: - Welcome
struct CatFacts: Codable {
    let currentPage: Int
    let data: [CatInfo]
    let firstPageURL: String
    let from, lastPage: Int
    let lastPageURL: String
    let links: [Link]
    let nextPageURL, path: String
    let perPage: String
    let prevPageURL: String?
    let to, total: Int

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case data
        case firstPageURL = "first_page_url"
        case from
        case lastPage = "last_page"
        case lastPageURL = "last_page_url"
        case links
        case nextPageURL = "next_page_url"
        case path
        case perPage = "per_page"
        case prevPageURL = "prev_page_url"
        case to, total
    }
}

// MARK: - CatInfo
struct CatInfo: Codable {
    let breed, country, origin, coat: String
    let pattern: String
}

// MARK: - Link
struct Link: Codable {
    let url: String?
    let label: String
    let active: Bool
}



