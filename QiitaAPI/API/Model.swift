//
//  Model.swift
//  QiitaAPI
//
//  Created by Juri Ohto on 2021/12/28.
//

import Foundation

struct Article: Decodable {

    let title: String
    let updatedAt: Date
    let url: String
    let user: User

    private enum CodingKeys: String, CodingKey {

        case title
        case updatedAt = "updated_at"
        case url
        case user
    }
}

struct User: Decodable {

    let id: String
    let name: String?
    let profileImageURL: String

    private enum CodingKeys: String, CodingKey {

        case id
        case name
        case profileImageURL = "profile_image_url"
    }
}
