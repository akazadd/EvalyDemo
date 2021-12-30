//
//  TopBrands.swift
//  EvalyDemoApp
//
//  Created by Azad on 4/5/21.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let topShops = try? newJSONDecoder().decode(TopShops.self, from: jsonData)

import Foundation

// MARK: - TopShops
class TopBrands: Codable {
    let next, previous, message: String
    let data: [TopBrand]

    init(next: String, previous: String, message: String, data: [TopBrand]) {
        self.next = next
        self.previous = previous
        self.message = message
        self.data = data
    }
}

// MARK: - Datum
class TopBrand: Codable {
    let id: Int
    let name: String?
    let approved: Bool
    let slug: String?
    let brandType: BrandType?
    let imageURL: String?
    let status: Status?
    let brandScore, version: Int?

    enum CodingKeys: String, CodingKey {
        case id, name, approved, slug
        case brandType = "brand_type"
        case imageURL = "image_url"
        case status
        case brandScore = "brand_score"
        case version
    }

    init(id: Int, name: String, approved: Bool, slug: String, brandType: BrandType, imageURL: String, status: Status, brandScore: Int, version: Int) {
        self.id = id
        self.name = name
        self.approved = approved
        self.slug = slug
        self.brandType = brandType
        self.imageURL = imageURL
        self.status = status
        self.brandScore = brandScore
        self.version = version
    }
}

enum BrandType: String, Codable {
    case general = "general"
    case med = "med"
}

enum Status: String, Codable {
    case active = "active"
}
