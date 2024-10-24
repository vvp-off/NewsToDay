//
//  NetworkManager.swift
//  NewsToDay
//
//  Created by Alexander Bokhulenkov on 23.10.2024.
//

import Foundation

final class NetworkManager {
    
    // MARK: - Properties
    
    private let key = "952c0e9330a946688f8c004d576640bd"
//    private let textURL = "https://newsapi.org/v2/"
    private let textURL = "https://newsapi.org/v2/top-headlines?category=technology&q=apple&sortBy=popularity&apiKey=952c0e9330a946688f8c004d576640bd"
    
    private let sessions: URLSession
    
    init(with configuraiton: URLSessionConfiguration) {
        sessions = URLSession(configuration: configuraiton)
    }
    
    private lazy var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
    
    // MARK: - Methods
    
    func fetchNews() async throws -> [Article] {
        
        guard let url = URL(string: textURL) else { fatalError("Ошибка url")}
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        
        let responseData = try await sessions.data(for: urlRequest)
        let dataNews = responseData.0
        
        do {
            let data = try decoder.decode(NewsRequestModel.self, from: dataNews)
            return data.articles
        }
        catch {
            print("error data \(error)")
            return []
        }
    }
}
/*
enum HTTP {
    enum Method: String {
        case get = "GET"
        case post = "POST"
    }
    enum Headers {
        enum Key: String {
            case contentType = "Content-Type"
            case apikey = "X-CMC_PRO_API_KEY"
        }
        enum Value: String {
            case applicationison = "application/json"
        }
    }
}
*/
