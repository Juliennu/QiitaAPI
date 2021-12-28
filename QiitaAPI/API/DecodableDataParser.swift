//
//  DecodableDataParser.swift
//  QiitaAPI
//
//  Created by Juri Ohto on 2021/12/28.
//
import APIKit
import Foundation

// DataParserのカスタム
final class DecodableDataParser: APIKit.DataParser {

    var contentType: String? {
        return "application/json"
    }

    func parse(data: Data) throws -> Any {
        return data // parseを行わずにそのままデータを返す
    }
}
