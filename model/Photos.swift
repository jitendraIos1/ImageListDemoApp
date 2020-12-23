//
//  Photos.swift
//  ImageListDemo App
//
//  Created by Jitendra Kumar on 21/12/20.
//

import Foundation
struct Photos: Codable {
    let format: Format?
    let width, height: Int?
    let filename: String?
    let id: Int?
    let author: String?
    let authorURL, postURL: String?

    enum CodingKeys: String, CodingKey {
        case format, width, height, filename, id, author
        case authorURL = "author_url"
        case postURL = "post_url"
    }
}

enum Format: String, Codable {
    case jpeg = "jpeg"
}

typealias Welcome = [Photos]
