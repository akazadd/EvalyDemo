//
//  HomeInteractor.swift
//  EvalyDemoApp
//
//  Created by Azad on 4/5/21.
//

import UIKit
import Alamofire

class HomeInteractor : HomePresenterToInteractorProtocol{
    
    weak var presenter: HomeInteractorToPresenterProtocol?
    
    var topShops: [TopShop]?
    var topBrands: [TopBrand]?
    var topProducts: [TopProduct]?
    
    
//        , completetionHandler: @escaping (TopShops?, String?) -> Void
    
    func fetchTopShops(page : Int ) {
        AF.request(Constants.TopShops(page), method: .get, parameters: nil, encoding: JSONEncoding.default)
            .responseData { (response) in
                switch response.result {
                case .success(let data):
                    print(String(decoding: data, as: UTF8.self))
                    let decoder = JSONDecoder()
                    
                    do{
                        let decoded = try decoder.decode(TopShops.self, from: data)
                        if !(page > 1){
                            self.topShops = decoded.data
                        }else{
                            self.topShops?.append(contentsOf: decoded.data)
                        }
                        
                        self.presenter?.topShopsFetched()
                    } catch let error {
                        print(error)
                        self.presenter?.topShopsFetchedFailed()
                    }
                    
                case .failure( _):
                    self.presenter?.topShopsFetchedFailed()
                }
        }
    }
    
    func fetchTopBrands(page: Int) {
        AF.request(Constants.TopBrands(page), method: .get, parameters: nil, encoding: JSONEncoding.default)
            .responseData { (response) in
                switch response.result {
                case .success(let data):
                    print(String(decoding: data, as: UTF8.self))
                    let decoder = JSONDecoder()
                    do{
                        let decoded = try decoder.decode(TopBrands.self, from: data)
                        
                        if !(page > 1){
                            self.topBrands = decoded.data
                        }else{
                            self.topBrands?.append(contentsOf: decoded.data)
                        }
                        self.presenter?.topBrandsFetched()
                    } catch let error {
                        print(error)
                    }
                case .failure( _):
                    self.presenter?.topBrandsFetchedFailed()
                }
        }
    }
    
    func fetchTopProducts(page: Int) {
        AF.request(Constants.TopProducts(page), method: .get, parameters: nil, encoding: JSONEncoding.default)
            .responseData { (response) in
                switch response.result {
                case .success(let data):
                    print(String(decoding: data, as: UTF8.self))
                    let decoder = JSONDecoder()
                    do{
                        _ = try decoder.decode(TopProducts.self, from: data)
                    } catch let error {
                        print(error)
                    }
                    if let successDecoded = try? decoder.decode(TopProducts.self, from: data){
                        if page > 1{
                            self.topProducts?.append(contentsOf: successDecoded.data)
                        }else{
                            self.topProducts = successDecoded.data
                        }
                        self.presenter?.topProductsFetched()
                    }else{
                        self.presenter?.topProductsFetchedFailed()
                    }
                case .failure( _):
                    self.presenter?.topProductsFetchedFailed()
                }
        }
    }
    
    
}
