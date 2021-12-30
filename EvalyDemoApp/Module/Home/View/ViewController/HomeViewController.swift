//
//  HomeViewController.swift
//  EvalyDemoApp
//
//  Created by Azad on 4/5/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter : HomeViewToPresenterProtcol?
    
    var numberOfSections : Int = 3
    
    var indicator : LoadingIndicator?
    
    var canLoadMore = true
    
    var topProductPageNumber: Int = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indicator = LoadingIndicator(view: self.view)
        self.configureTableView()
        self.updateView()
    }

    func updateView(){
        indicator?.startAnimation()
        presenter?.getTopShops(page: 1)
        presenter?.getTopBrands(page: 1)
        presenter?.getTopProducts(page: 1)
    }

}

extension HomeViewController : UITableViewDataSource{
    
    func configureTableView(){
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.tableFooterView = UIView()
        self.tableView.separatorStyle = .none
        self.tableView.register(WelcomeCell.nib, forCellReuseIdentifier: WelcomeCell.identifier)
        self.tableView.register(TopShopCell.nib, forCellReuseIdentifier: TopShopCell.identifier)
        self.tableView.register(TopBrandCell.nib, forCellReuseIdentifier: TopBrandCell.identifier)
        self.tableView.register(TopProductCell.nib, forCellReuseIdentifier: TopProductCell.identifier)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell : WelcomeCell = tableView.dequeueReusableCell(withIdentifier: WelcomeCell.identifier, for: indexPath) as! WelcomeCell
            
            return cell
        case 1:
            let cell: TopShopCell = tableView.dequeueReusableCell(withIdentifier: TopShopCell.identifier, for: indexPath) as! TopShopCell
            
            if let topShops = presenter?.topShops(){
                cell.homeVC = self
                cell.bindTopShops(topShops: topShops)
            }
            return cell
        case 2:
            let cell: TopBrandCell = tableView.dequeueReusableCell(withIdentifier: TopBrandCell.identifier, for: indexPath) as! TopBrandCell
            
            if let topBrands = presenter?.topBrands(){
                cell.homeVC = self
                cell.bindTopBrands(topBrands: topBrands)
            }
            return cell
        case 3:
            let cell: TopProductCell = tableView.dequeueReusableCell(withIdentifier: TopProductCell.identifier, for: indexPath) as! TopProductCell
            if let topProducts = presenter?.topProducts(){
                cell.homeVC = self
                cell.bindTopProducts(topProducts: topProducts)
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    
}

extension HomeViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return WelcomeCell.height
        case 1:
            return TopShopCell.height
        case 2:
            return UITableView.automaticDimension
        case 3:
            return UITableView.automaticDimension
        default:
            return 0
        }
        
    }
}

// MARK: - LiveNewsListPresenterToViewProtocol
extension HomeViewController: HomePresenterToViewProtocol {
    func showTopShopItem() {
        tableView.reloadData()
    }
    
    func showTopBrandItem() {
        tableView.reloadData()
    }
    
    func showTopProductItem() {
        tableView.reloadData()
        indicator?.stopAnimation()
    }
    
    func showError() {
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching Home", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}




