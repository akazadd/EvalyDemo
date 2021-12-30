//
//  TopProductCell.swift
//  EvalyDemoApp
//
//  Created by Azad on 4/8/21.
//

import UIKit

class TopProductCell: UITableViewCell {

    static var nib : UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    static var identifier: String{
        return String(describing: self)
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var topProducts = [TopProduct]()
    var topProductPageNumber: Int = 1
    
    var alreadyInApiCall : Bool = true
    
    var homeVC: HomeViewController?
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.configureCollectionView()
    }

    func bindTopProducts(topProducts : [TopProduct]){
        self.topProducts = topProducts
        self.collectionView.reloadData()
        self.collectionView.layoutIfNeeded()
    }
   
    
}

extension TopProductCell : UICollectionViewDelegate, UICollectionViewDataSource{
    
    func configureCollectionView(){
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        if let layout = collectionView?.collectionViewLayout as? AdaptiveLayout {
          layout.delegate = self
        }
        collectionView?.backgroundColor = .clear
        
        self.collectionView.register(ProductCell.nib, forCellWithReuseIdentifier: ProductCell.identifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("topProductCount-->\(topProducts.count)")
        return topProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : ProductCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.identifier, for: indexPath) as! ProductCell
        let topProduct = topProducts[indexPath.row]
        cell.bindProductData(product: topProduct)
        
        return cell
    }
    
}


extension TopProductCell: AdaptiveCollectionLayoutDelegate {
  func collectionView(
    _ collectionView: UICollectionView,
    heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
    let imageStr = topProducts[indexPath.item].imageUrls?[0] ?? ""
    let imageSize = UIImage.getImageSizeWithURL(url: imageStr)
    
    //All image size(1000,1000)
    //To get the required view i used some random height
    
    let heights : [CGFloat] = [350,300,250,330,370,200,300,320,400,290]
    let height = heights.randomElement() ?? 0
    return height
  }


}

extension UIImage {
    class func getImageSizeWithURL(url:String?) -> CGSize {
        var imageSize:CGSize = .zero
        guard let imageUrlStr = url else { return imageSize }
        guard imageUrlStr != "" else {return imageSize}
        guard let imageUrl = URL(string: imageUrlStr) else { return imageSize }
 
        guard let imageSourceRef = CGImageSourceCreateWithURL(imageUrl as CFURL, nil) else {return imageSize}
        guard let imagePropertie = CGImageSourceCopyPropertiesAtIndex(imageSourceRef, 0, nil)  as? Dictionary<String,Any> else {return imageSize }
        imageSize.width = CGFloat((imagePropertie[kCGImagePropertyPixelWidth as String] as! NSNumber).floatValue)
        imageSize.height = CGFloat((imagePropertie[kCGImagePropertyPixelHeight as String] as! NSNumber).floatValue)
        return imageSize
    }
}


extension UIImage {
  convenience init?(url: URL?) {
    guard let url = url else { return nil }
            
    do {
      self.init(data: try Data(contentsOf: url))
    } catch {
      print("Cannot load image from url: \(url) with error: \(error)")
      return nil
    }
  }
}
