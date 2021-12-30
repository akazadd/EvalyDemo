//
//  BrandCell.swift
//  EvalyDemoApp
//
//  Created by Azad on 4/7/21.
//

import UIKit

class BrandCell: UICollectionViewCell {

    static var nib:UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier : String{
        return String(describing: self)
    }
    
    static var size: CGSize{
        return CGSize(width: 100, height: 100)
    }
    @IBOutlet weak var containerView: UIView!{
        didSet{
            containerView.layer.cornerRadius = 12
        }
    }
    @IBOutlet weak var brandLogoImgView: UIImageView!
    @IBOutlet weak var brandNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bindBrandData(brand: TopBrand){
        brandNameLbl.text = brand.name
        
        if let imgStr = brand.imageURL{
            let imageURL = URL(string : imgStr)
            brandLogoImgView.kf.setImage(with: imageURL)
        }
    }

}
