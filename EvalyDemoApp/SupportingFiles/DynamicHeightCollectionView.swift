//
//  DynamicHeightCollectionView.swift
//  EvalyDemoApp
//
//  Created by Azad on 4/7/21.
//
import UIKit
class DynamicHeightCollectionView: UICollectionView {
    override func layoutSubviews() {
        super.layoutSubviews()
        if bounds.size != intrinsicContentSize {
            self.invalidateIntrinsicContentSize()
        }
    }
    override var intrinsicContentSize: CGSize {
        return collectionViewLayout.collectionViewContentSize
    }
}
