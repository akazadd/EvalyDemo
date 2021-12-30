//
//  ProductCell.swift
//  EvalyDemoApp
//
//  Created by Azad on 4/8/21.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    static var nib:UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier:String{
        return String(describing: self)
    }
    
    @IBOutlet weak var containerView: UIView!{
        didSet{
            containerView.layer.cornerRadius = 12
        }
    }
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var maxPriceLbl: UILabel!
    @IBOutlet weak var discountedPriceLbl: UILabel!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var liveViewWidth: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func bindProductData(product: TopProduct){
        if let name = product.name{
            nameLbl.text = name
        }
        if product.imageUrls?.count ?? 0 > 0{
            if let imgUrl = product.imageUrls?[0]{
                let imageUrl = URL(string: imgUrl)
                imgView.kf.setImage(with: imageUrl)
            }
        }
        if let maxPrice = product.maxPrice{
            maxPriceLbl.text = "৳ \(maxPrice.toString())"
        }
        if let discountedPrice = product.minDiscountedPrice{
            discountedPriceLbl.text = "৳ \(discountedPrice.toString())"
//            liveViewWidth.constant = CGFloat(discountedPriceLbl.text?.count ?? 0)
        }
        
    }
    
}

extension Int
{
    func toString() -> String
    {
        let myString = String(self)
        return myString
    }
}
