//
//  FetchQiitaArticleRequest.swift
//  QiitaAPI
//
//  Created by Juri Ohto on 2021/12/28.
//
import APIKit
import Foundation

struct FetchQiitaArticleRequest: QiitaAPI {
    // レスポンスのデータ構造
    typealias Response = [Article]

    var path: String {
        return "items"
    }

    // HTTPメソッド
    var method: HTTPMethod {
        return .get
    }

    let query: String?
    var queryParameters: [String : Any]? {
        guard let query = query else {
            return ["page": 1, "per_page": 20 ]
        }
        return ["query": "title: \(query)"]
    }
}
