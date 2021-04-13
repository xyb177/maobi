//
//  Ccell.swift
//  NSTDemo
//
//  Created by 潘宣亦 on 2021/4/13.
//  Copyright © 2021 monoqle. All rights reserved.
//

import UIKit

class Ccell: UTableViewCell {
    
    private var image1 = UIImageView()
    private var  switch1 = UISwitch()
    
    
    
    override func configUI() {
        
        separatorInset = .zero
        
        contentView.addSubview(image1)
        image1.image=UIImage(named:"paris")
        image1.snp.makeConstraints{
            $0.left.top.bottom.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 0))
            $0.size.equalTo(100)
        }
        
        contentView.addSubview(switch1)
        switch1.layer.cornerRadius = 15
        switch1.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().offset(-10)
        }
        
        
        
        
    }
    
}
