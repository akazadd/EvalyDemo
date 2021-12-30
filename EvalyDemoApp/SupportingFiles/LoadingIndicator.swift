//
//  LoadingIndicator.swift
//  EvalyDemoApp
//
//  Created by Azad on 4/8/21.
//

import UIKit
import NVActivityIndicatorView
class LoadingIndicator {
    
    var loadingIndicator: NVActivityIndicatorView? = nil
    var blockerView : UIView? = nil
    
    init(view : UIView){
        blockerView = UIView(frame: view.frame)
        loadingIndicator = NVActivityIndicatorView(frame: .init(x: view.bounds.midX - 20, y: view.bounds.midY - 20, width: 40, height: 40))
        loadingIndicator?.color = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        loadingIndicator?.type = .lineScalePulseOutRapid
        blockerView?.addSubview(loadingIndicator!)
        blockerView?.clipsToBounds = false
        view.addSubview(blockerView!)
        blockerView?.isHidden = true
    }
    
    func startAnimation() {
        blockerView?.isHidden = false
        loadingIndicator?.startAnimating()
        
    }
    
    func stopAnimation() {
        loadingIndicator?.stopAnimating()
        blockerView?.isHidden = true
    }
    
    func isAnimating() -> Bool{
        if ((loadingIndicator?.isAnimating) != nil){
            return true
        }else{
            return false
        }
    }
    
    
}
