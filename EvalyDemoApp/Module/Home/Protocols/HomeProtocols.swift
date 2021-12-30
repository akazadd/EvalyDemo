//
//  HomeProtocols.swift
//  EvalyDemoApp
//
//  Created by Azad on 4/5/21.
//

import UIKit

protocol HomePresenterToViewProtocol: AnyObject {
    func showTopShopItem()
    func showTopBrandItem()
    func showTopProductItem()
    func showError()
}

protocol HomeInteractorToPresenterProtocol: AnyObject {
    func topShopsFetched()
    func topShopsFetchedFailed()
    func topBrandsFetched()
    func topBrandsFetchedFailed()
    func topProductsFetched()
    func topProductsFetchedFailed()
}

protocol HomePresenterToInteractorProtocol: AnyObject {
    var presenter : HomeInteractorToPresenterProtocol? { get set }
    var topShops : [TopShop]? { get }
    var topBrands : [TopBrand]? { get }
    var topProducts : [TopProduct]? { get }
    
    func fetchTopShops(page: Int)
    func fetchTopBrands(page: Int)
    func fetchTopProducts(page: Int)
}

protocol HomeViewToPresenterProtcol: AnyObject {
    var view : HomePresenterToViewProtocol? { get set }
    var interactor :  HomePresenterToInteractorProtocol? { get set }
    var router : HomePresenterToRouterProtocol? { get set }
        
    func updateView()
    
    func getTopShops(page: Int)
    func topShops() -> [TopShop]?
    func getTopBrands(page: Int)
    func topBrands() -> [TopBrand]?
    func getTopProducts(page: Int)
    func topProducts() -> [TopProduct]?
    
}

protocol HomePresenterToRouterProtocol : AnyObject {
    static func createModule() -> UIViewController
}
