//
//  HomePresenter.swift
//  EvalyDemoApp
//
//  Created by Azad on 4/5/21.
//

import UIKit

class HomePresenter : HomeViewToPresenterProtcol{
    
    
    var view: HomePresenterToViewProtocol?
    var interactor: HomePresenterToInteractorProtocol?
    var router: HomePresenterToRouterProtocol?
    
    func updateView() {
        interactor?.fetchTopShops(page: 1) 
//        let dispatchGroup = DispatchGroup()
//        dispatchGroup.enter()
//        interactor?.fetchTopShops(page: 1)
//        dispatchGroup.leave()
//        dispatchGroup.enter()
//        interactor?.fetchTopBrands(page: 1)
//        dispatchGroup.leave()
//        dispatchGroup.enter()
//        interactor?.fetchTopProducts(page: 1)
//        dispatchGroup.leave()
    }
    
    func getTopShops(page: Int){
        interactor?.fetchTopShops(page: page)
    }
    
    func topShops() -> [TopShop]? {
        return interactor?.topShops
    }
    
    func getTopBrands(page: Int){
        interactor?.fetchTopBrands(page: page)
    }
    
    func topBrands() -> [TopBrand]? {
        return interactor?.topBrands
    }
    
    func getTopProducts(page: Int){
        interactor?.fetchTopProducts(page: page)
    }
    
    func topProducts() -> [TopProduct]? {
        return interactor?.topProducts
    }
    
    
}

extension HomePresenter : HomeInteractorToPresenterProtocol{
    func topShopsFetched() {
        view?.showTopShopItem()
    }
    
    func topShopsFetchedFailed() {
        view?.showError()
    }
    
    func topBrandsFetched() {
        view?.showTopBrandItem()
    }
    
    func topBrandsFetchedFailed() {
        view?.showError()
    }
    
    func topProductsFetched() {
        view?.showTopProductItem()
    }
    
    func topProductsFetchedFailed() {
        view?.showError()
    }
    
    
}
