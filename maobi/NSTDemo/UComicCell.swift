//
//  Ucomicview.swift
//  NSTDemo
//
//  Created by 潘宣亦 on 2021/3/26.
//  Copyright © 2021 monoqle. All rights reserved.
//

import UIKit 

class UComicCell :UTableViewCell {
    private   var imageview: UIImageView {
        let im = UIImageView()
        im.contentMode = .scaleAspectFill
        im.clipsToBounds = true
        return im
        
    }
    
    
   /* private var titlelabel :UILabel {
        let tl = UILabel()
        tl.textColor = UIColor.black
        tl.font = UIFont.systemFont(ofSize: 14)
        return tl
    }
    private var button1 :UIButton {
        let b1 = UIButton()
        b1.setTitle("收藏", for: .normal)
        b1.backgroundColor=UIColor.blue
        return b1
    }
    
    private var button2 :UIButton {
        let b2 = UIButton()
        b2.setTitle("选择", for: .normal)
        b2.backgroundColor = UIColor.red
        return b2
    }
    private var desclabel :UILabel{
        let dl = UILabel()
        dl.textColor = UIColor.black
        dl.font = UIFont.systemFont(ofSize: 10)
        return dl
    }*/
    
    override func configUI() {
        clipsToBounds = true
        contentView.addSubview(imageview)
        imageview.image = UIImage(named:"paris")
        imageview.snp.makeConstraints{(make) in
            make.top.equalToSuperview().offset(10)
            make.width.equalTo(100)
            
        }
        
        /*contentView.addSubview(titlelabel)
        titlelabel.snp.makeConstraints{(make)in
            make.left.equalTo(imageview.snp.right).offset(10)
            make.top.equalTo(imageview)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(20)
        }
        
        contentView.addSubview(desclabel)
        desclabel.snp.makeConstraints{(make)in
            make.left.equalTo(imageview.snp.right).offset(10)
            make.right.equalToSuperview().offset(-10)
            make.top.equalTo(titlelabel.snp.bottom).offset(10)
        }
        contentView.addSubview(button2)
        button2.snp.makeConstraints{(make)in
            make.bottom.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(10)
            make.width.equalTo(20)
            make.height.equalTo(15)
        }
        
        contentView.addSubview(button1)
        button1.snp.makeConstraints{(make)in
            make.width.height.equalTo(button2)
            make.bottom.equalToSuperview().offset(10)
            make.right.equalTo(button2.snp.left).offset(5)
    }
    }
    

var indexPath: IndexPath? {
    didSet {
        guard let indexPath = indexPath else { return }
        if indexPath.row == 0 { imageview.image = UIImage.init(named: "paris") }
        else if indexPath.row == 1 { imageview.image = UIImage.init(named: "paris") }
        else if indexPath.row == 2 { imageview.image = UIImage.init(named: "paris") }
        else { imageview.image = nil }
    }*/
}
}
