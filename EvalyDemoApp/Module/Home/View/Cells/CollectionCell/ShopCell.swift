//
//  ShopCell.swift
//  EvalyDemoApp
//
//  Created by Azad on 4/5/21.
//

import UIKit
import Kingfisher

class ShopCell: UICollectionViewCell {
    
    static var nib:UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier : String{
        return String(describing: self)
    }
    
    static var size : CGSize{
        return CGSize(width: 120, height: 140)
    }
    @IBOutlet weak var containerView: UIView!{
        didSet{
            containerView.layer.cornerRadius = 12
        }
    }
    
    @IBOutlet weak var shopLogoImgView: UIImageView!
    @IBOutlet weak var shopNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    func bindShopData(item: TopShop){
        shopNameLbl.text = item.shopName
        
        if let imgStr = item.logoImage{
            let imageURL = URL(string : imgStr)
            shopLogoImgView.kf.setImage(with: imageURL)
        }
        
    }

}
