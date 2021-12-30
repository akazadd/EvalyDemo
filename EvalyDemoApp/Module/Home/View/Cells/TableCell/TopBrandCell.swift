//
//  TopBrandCell.swift
//  EvalyDemoApp
//
//  Created by Azad on 4/7/21.
//

import UIKit

class TopBrandCell: UITableViewCell {

    static var nib:UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier : String{
        return String(describing: self)
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var loadMoreBtn: UIButton!
    var topBrands = [TopBrand]()
    var topBrandPageNumber: Int = 1
    
    var homeVC: HomeViewController?
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.configureCollectionView()
        
        self.loadMoreBtn.addTarget(self, action: #selector(onLoadMoreBtnTapped), for: .touchUpInside)
        
    }
    
    func bindTopBrands(topBrands : [TopBrand]){
        self.topBrands = topBrands
        self.collectionView.reloadData()
        self.collectionView.layoutIfNeeded()
    }
    
    @objc
    func onLoadMoreBtnTapped(_ sender: UIButton){
        topBrandPageNumber += 1
        homeVC?.presenter?.getTopBrands(page: topBrandPageNumber)
        self.collectionView.reloadData()
        self.collectionView.layoutIfNeeded()
    }

    
}

extension TopBrandCell : UICollectionViewDataSource{
    
    func configureCollectionView(){
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.contentInsetAdjustmentBehavior = .always
        self.collectionView.register(BrandCell.nib, forCellWithReuseIdentifier: BrandCell.identifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topBrands.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : BrandCell = collectionView.dequeueReusableCell(withReuseIdentifier: BrandCell.identifier, for: indexPath) as! BrandCell
        let topBrand = topBrands[indexPath.row]
        cell.bindBrandData(brand: topBrand)
        
        return cell
    }
    
    
    
}

extension TopBrandCell : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let noOfCellsInRow = 4

        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))

        return CGSize(width: size, height: size)
    }
    
}




