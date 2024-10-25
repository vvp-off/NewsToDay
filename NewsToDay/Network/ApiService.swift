//
//  ApiService.swift
//  NewsToDay
//
//  Created by Alexander Bokhulenkov on 25.10.2024.
//

import Foundation

// enum различных вариантов для адреса

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
