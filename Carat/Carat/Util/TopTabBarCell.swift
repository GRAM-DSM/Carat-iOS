//
//  TopTabBar.swift
//  Carat
//
//  Created by 이가영 on 2020/09/05.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class TopTabBarCell: UICollectionViewCell{
    
    @IBOutlet weak var titleLabel: UILabel!

    override var isHighlighted: Bool{
        didSet {
            titleLabel.textColor = isHighlighted ? UIColor.black : UIColor.gray
        }
    }
    
    override var isSelected: Bool{
        didSet {
            titleLabel.textColor = isSelected ? UIColor.black : UIColor.gray
        }
    }
}
