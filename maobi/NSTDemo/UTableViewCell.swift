//
//  Ucollectionview.swift
//  NSTDemo
//
//  Created by 潘宣亦 on 2021/3/26.
//  Copyright © 2021 monoqle. All rights reserved.
//

import UIKit
import Reusable

class UTableViewCell : UITableViewCell, Reusable {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func configUI() {}

}

