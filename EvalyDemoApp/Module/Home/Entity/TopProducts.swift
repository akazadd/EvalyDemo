//
//  TopProducts.swift
//  EvalyDemoApp
//
//  Created by Azad on 4/5/21.
//

import Foundation

// MARK: - TopProducts
struct TopProducts: Codable {
    let next, previous, message: String?
    let data: [TopProduct]
}

// MARK: - Datum
struct TopProduct: Codable {
    let name, slug: String?
    let imageUrls: [String]?
    let priceType: PriceType?
    let maxPrice, minPrice, minDiscountedPrice: Int?

    enum CodingKeys: String, CodingKey {
        case name, slug
        case imageUrls = "image_urls"
        case priceType = "price_type"
        case maxPrice = "max_price"
        case minPrice = "min_price"
        case minDiscountedPrice = "min_discounted_price"
    }
}

enum PriceType: String, Codable {
    case fixed = "fixed"
}
