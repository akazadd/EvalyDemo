//
//  WelcomeCell.swift
//  EvalyDemoApp
//
//  Created by Azad on 4/5/21.
//

import UIKit

class WelcomeCell: UITableViewCell {
    
    static var nib : UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier : String{
        return String(describing: self)
    }
    
    static var height : CGFloat{
        return 80
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
