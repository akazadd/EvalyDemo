//
//  TopShopCell.swift
//  EvalyDemoApp
//
//  Created by Azad on 4/5/21.
//

import UIKit

class TopShopCell: UITableViewCell {

    static var nib : UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier : String{
        return String(describing: self)
    }
    
    static var height : CGFloat{
        return 200
    }
        
    var topShops = [TopShop]()
    var topShopPageNumber: Int = 1
    var alreadyInApiCallToShop : Bool = true

        
    @IBOutlet weak var collectionView: UICollectionView!
    
//    var presenterInstance : HomeViewToPresenterProtcol?
    var homeVC: HomeViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.configureCollectionView()
        
    }
    
    func bindTopShops(topShops : [TopShop]){
        self.topShops = topShops
        self.collectionView.reloadData()
        self.alreadyInApiCallToShop = false
    }
    
}

extension TopShopCell : UICollectionViewDataSource{
    
    func configureCollectionView(){
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(ShopCell.nib, forCellWithReuseIdentifier: ShopCell.identifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topShops.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : ShopCell = collectionView.dequeueReusableCell(withReuseIdentifier: ShopCell.identifier, for: indexPath) as! ShopCell
        let topShop = topShops[indexPath.row]
        cell.bindShopData(item: topShop)
        
        return cell
    }
    
    
    
}

extension TopShopCell : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return ShopCell.size
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if topShops.count - 1 == indexPath.row{
            if alreadyInApiCallToShop == false{
                
                topShopPageNumber += 1
                print("topShopPageNumber->\(topShopPageNumber)")
                homeVC?.presenter?.getTopProducts(page: topShopPageNumber)
                alreadyInApiCallToShop = true
            }
        }
    }
}



