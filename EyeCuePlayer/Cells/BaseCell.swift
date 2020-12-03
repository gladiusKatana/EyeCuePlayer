// eyeCuePlayer ･ BaseCell.swift
import UIKit

class BaseCell: UICollectionViewCell {   ///MARK:----------------------------- BASE CELL class -------------------------------------------
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews(){}
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

