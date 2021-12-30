//
//  TopShops.swift
//  EvalyDemoApp
//
//  Created by Azad on 4/5/21.
//

import Foundation

// MARK: - TopShops
class TopShops: Codable {
    let next, previous, message: String
    let data: [TopShop]

    init(next: String, previous: String, message: String, data: [TopShop]) {
        self.next = next
        self.previous = previous
        self.message = message
        self.data = data
    }
}

// MARK: - Datum
class TopShop: Codable {
    let slug, contactNumber, shopName: String?
    let shopImage, logoImage: String?
    let address, datumDescription: String?
    let approval: Bool?
    let ownerUsername, ownerName, ownerNumber: String?
    let cashbackPercentage, score: Int?
    let isCodAllowed: Bool?
    let campaignCategoryName, campaignCategorySlug, campaignName, campaignSlug: String?
    let campaignStartAt, campaignEndsAt: String?

    enum CodingKeys: String, CodingKey {
        case slug = "slug"
        case contactNumber = "contact_number"
        case shopName = "shop_name"
        case shopImage = "shop_image"
        case logoImage = "logo_image"
        case address = "address"
        case datumDescription = "description"
        case approval = "approval"
        case ownerUsername = "owner_username"
        case ownerName = "owner_name"
        case ownerNumber = "owner_number"
        case cashbackPercentage = "cashback_percentage"
        case score = "score"
        case isCodAllowed = "is_cod_allowed"
        case campaignCategoryName = "campaign_category_name"
        case campaignCategorySlug = "campaign_category_slug"
        case campaignName = "campaign_name"
        case campaignSlug = "campaign_slug"
        case campaignStartAt = "campaign_start_at"
        case campaignEndsAt = "campaign_ends_at"
    }

    init(slug: String?, contactNumber: String?, shopName: String?, shopImage: String?, logoImage: String?, address: String?, datumDescription: String?, approval: Bool, ownerUsername: String?, ownerName: String?, ownerNumber: String?, cashbackPercentage: Int?, score: Int?, isCodAllowed: Bool, campaignCategoryName: String?, campaignCategorySlug: String?, campaignName: String?, campaignSlug: String?, campaignStartAt: String?, campaignEndsAt: String?) {
        self.slug = slug
        self.contactNumber = contactNumber
        self.shopName = shopName
        self.shopImage = shopImage
        self.logoImage = logoImage
        self.address = address
        self.datumDescription = datumDescription
        self.approval = approval
        self.ownerUsername = ownerUsername
        self.ownerName = ownerName
        self.ownerNumber = ownerNumber
        self.cashbackPercentage = cashbackPercentage
        self.score = score
        self.isCodAllowed = isCodAllowed
        self.campaignCategoryName = campaignCategoryName
        self.campaignCategorySlug = campaignCategorySlug
        self.campaignName = campaignName
        self.campaignSlug = campaignSlug
        self.campaignStartAt = campaignStartAt
        self.campaignEndsAt = campaignEndsAt
    }
}


//import Foundation
//
//// MARK: - TopShops
//struct TopShops: Codable {
//    let next, previous, message: String
//    let data: [TopShop]
//}
//
//// MARK: - Datum
//struct TopShop: Codable {
//    let slug, contactNumber, shopName: String?
//    let shopImage, logoImage: String?
//    let address, datumDescription: String?
//    let approval: Bool = false
//    let ownerUsername, ownerName, ownerNumber: String?
//    let cashbackPercentage, score: Int?
//    let isCodAllowed: Bool = false
//    let campaignCategoryName, campaignCategorySlug, campaignName, campaignSlug: String?
//    let campaignStartAt, campaignEndsAt: Date?
//
//    enum CodingKeys: String, CodingKey {
//        case slug
//        case contactNumber = "contact_number"
//        case shopName = "shop_name"
//        case shopImage = "shop_image"
//        case logoImage = "logo_image"
//        case address
//        case datumDescription = "description"
//        case approval
//        case ownerUsername = "owner_username"
//        case ownerName = "owner_name"
//        case ownerNumber = "owner_number"
//        case cashbackPercentage = "cashback_percentage"
//        case score
//        case isCodAllowed = "is_cod_allowed"
//        case campaignCategoryName = "campaign_category_name"
//        case campaignCategorySlug = "campaign_category_slug"
//        case campaignName = "campaign_name"
//        case campaignSlug = "campaign_slug"
//        case campaignStartAt = "campaign_start_at"
//        case campaignEndsAt = "campaign_ends_at"
//    }
//}
