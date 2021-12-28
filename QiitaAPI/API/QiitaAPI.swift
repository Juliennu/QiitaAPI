//
//  QiitaAPI.swift
//  QiitaAPI
//
//  Created by Juri Ohto on 2021/12/28.
//
import APIKit
import Foundation

protocol QiitaAPI: Request { }

extension QiitaAPI {
    // レクエスト先のURL
    var baseURL: URL {
        return URL(string: "https://qiita.com/api/v2/")!
    }
}

extension QiitaAPI where Response: Decodable {

    var dataParser: DataParser {
        return DecodableDataParser()
    }
    // Responseデータのデコード
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        guard let data = object as? Data else {
            throw ResponseError.unexpectedObject(object)
        }
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(Response.self, from: data)
    }
}
