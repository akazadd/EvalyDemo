//
//  Config.swift
//  EvalyDemoApp
//
//  Created by Azad on 4/8/21.
//

import UIKit

struct AdaptiveCollectionConfig {
    
    static let bannerHeight: CGFloat = 120
    static let placeholderHeight: CGFloat = 210
    static var cellBaseHeight: CGFloat {
        //Need in project detect padding/height for smaller devices than iPhone 6
        return UIDevice.isPhoneSE ? 190 : 210
    }
    static let numberOfColumns = 2
    static var cellPadding: CGFloat {
        return UIDevice.isPhoneSE ? 4 : 8
    }
}


//If you prefer you can add it too
extension UIDevice {
    
    static var isPhoneSE: Bool {
        let screenWidth = UIScreen.main.bounds.width
        return screenWidth == 320
    }
    
}
