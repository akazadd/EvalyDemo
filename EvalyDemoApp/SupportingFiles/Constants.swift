//
//  Constants.swift
//  EvalyDemoApp
//
//  Created by Azad on 4/5/21.
//

import Foundation

class Constants{
//    https://api.evaly.com.bd/go-catalog/api/v1/public/shops?page=1
    static let BaseUrl : String = "https://api.evaly.com.bd/go-catalog/api/v1/public"
    
    public static let TopShops = { (pageNumber : Int) -> (String) in
        return "\(BaseUrl)/shops?page=\(pageNumber)"
    }
    
    public static let TopBrands = { (pageNumber: Int) -> (String) in
        return "\(BaseUrl)/brands?limit=8&page=\(pageNumber)"
    }
    
    public static let TopProducts = { (pageNumber: Int) -> (String) in
        return "\(BaseUrl)/products?page=\(pageNumber)"
    }
    
}
