//
//  NewsRequestModel.swift
//  NewsToDay
//
//  Created by Alexander Bokhulenkov on 21.10.2024.
//

import Foundation

// MARK: - News
struct NewsRequestModel: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let source: Source?
    let author, title, description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: Date?
    let content: String?
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String?
}

//typealias Articles = [Article]
