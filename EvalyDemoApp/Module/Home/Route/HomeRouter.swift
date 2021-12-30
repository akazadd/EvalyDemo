//
//  HomeRouter.swift
//  EvalyDemoApp
//
//  Created by Azad on 4/5/21.
//

import UIKit

class HomeRouter : HomePresenterToRouterProtocol{
    class func createModule() -> UIViewController {
        let view = HomeViewController()
        let presenter : HomeViewToPresenterProtcol & HomeInteractorToPresenterProtocol  = HomePresenter()
        let interactor : HomePresenterToInteractorProtocol = HomeInteractor()
        let router : HomePresenterToRouterProtocol = HomeRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
}
