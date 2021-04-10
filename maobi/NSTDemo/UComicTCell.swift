//
//  UComicTCell.swift
//  NSTDemo
//
//  Created by 潘宣亦 on 2021/4/8.
//  Copyright © 2021 monoqle. All rights reserved.
//

//
//  UComicTCell.swift
//  U17
//
//  Created by charles on 2017/11/8.
//  Copyright © 2017年 None. All rights reserved.
//

import UIKit

class UComicTCell: UTableViewCell {
    
    var spinnerName: String?

    private  lazy var iconView: UIImageView = {
        let iw = UIImageView()
        iw.contentMode = .scaleAspectFill
        iw.clipsToBounds = true
        return iw
    }()
    
    private  lazy var titleLabel: UILabel = {
        let tl = UILabel()
        tl.textColor = UIColor.black
        return tl
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let sl = UILabel()
        sl.textColor = UIColor.gray
        sl.font = UIFont.systemFont(ofSize: 14)
        return sl
    }()
    
    /*private lazy var descLabel: UILabel = {
        let dl = UILabel()
        dl.textColor = UIColor.gray
        dl.numberOfLines = 3
        dl.font = UIFont.systemFont(ofSize: 14)
        return dl
    }()
    
    private lazy var tagLabel: UILabel = {
        let tl = UILabel()
        tl.textColor = UIColor.orange
        tl.font = UIFont.systemFont(ofSize: 14)
        return tl
    }()*/
    
    private lazy var orderView: UIImageView = {
        let ow = UIImageView()
        ow.contentMode = .scaleAspectFit
        return ow
    }()
    private lazy var button1: UIButton = {
        let b1 = UIButton()
        b1.setTitle("收藏", for:.normal)
        b1.layer.cornerRadius=8.0
        b1.titleLabel?.font = UIFont.systemFont(ofSize: 10.0)
        b1.backgroundColor=UIColor.blue
        return b1
    }()
    
    private lazy var button2: UIButton = {
        let b2 = UIButton()
        b2.setTitle("选择", for: .normal)
        b2.layer.cornerRadius=8.0
        b2.titleLabel?.font = UIFont.systemFont(ofSize: 10.0)
        b2.backgroundColor = UIColor.red
        return b2
    }()
    
    override func configUI() {
        separatorInset = .zero
        
        contentView.addSubview(iconView)
        iconView.image = UIImage(named: "paris")
        iconView.snp.makeConstraints {
            $0.left.top.bottom.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 0))
            $0.width.equalTo(200)
        }
        
        contentView.addSubview(titleLabel)
        titleLabel.text = "田英章楷书入门"
        titleLabel.snp.makeConstraints {
            $0.left.equalTo(iconView.snp.right).offset(10)
            $0.right.equalToSuperview().offset(-10)
            $0.height.equalTo(30)
            $0.top.equalTo(iconView)
        }
        
        contentView.addSubview(subTitleLabel)
        subTitleLabel.text = "基本笔法"
        subTitleLabel.snp.makeConstraints {
            $0.left.equalTo(iconView.snp.right).offset(10)
            $0.right.equalToSuperview().offset(-10)
            $0.height.equalTo(20)
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
        }
        
        contentView.addSubview(button2)
        button2.snp.makeConstraints {
            $0.bottom.equalTo(iconView.snp.bottom)
            $0.width.equalTo(40)
            $0.height.equalTo(20)
            $0.right.equalToSuperview().offset(-20)
            
        }
        
        contentView.addSubview(button1)
        button1.snp.makeConstraints {
            $0.bottom.equalTo(iconView.snp.bottom)
            $0.width.equalTo(40)
            $0.height.equalTo(20)
            $0.right.equalTo(button2.snp.left).offset(-10)
        }
        
        contentView.addSubview(orderView)
        orderView.snp.makeConstraints {
            $0.bottom.equalTo(iconView.snp.bottom)
            $0.height.width.equalTo(30)
            $0.right.equalToSuperview().offset(-10)
        }
    }
    
    /*var model: ComicModel? {
        didSet {
            guard let model = model else { return }
            iconView.kf.setImage(urlString: model.cover, placeholder: UIImage(named: "normal_placeholder_v"))
            
            titleLabel.text = model.name
            subTitleLabel.text = "\(model.tags?.joined(separator: " ") ?? "") | \(model.author ?? "")"
            descLabel.text = model.description
            
            if spinnerName == "更新时间" {
                let comicDate = Date().timeIntervalSince(Date(timeIntervalSince1970: TimeInterval(model.conTag)))
                var tagString = ""
                if comicDate < 60 {
                    tagString = "\(Int(comicDate))秒前"
                } else if comicDate < 3600 {
                    tagString = "\(Int(comicDate / 60))分前"
                } else if comicDate < 86400 {
                    tagString = "\(Int(comicDate / 3600))小时前"
                } else if comicDate < 31536000{
                    tagString = "\(Int(comicDate / 86400))天前"
                } else {
                    tagString = "\(Int(comicDate / 31536000))年前"
                }
                tagLabel.text = "\(spinnerName!) \(tagString)"
                orderView.isHidden = true
            } else {
                var tagString = ""
                if model.conTag > 100000000 {
                    tagString = String(format: "%.1f亿", Double(model.conTag) / 100000000)
                } else if model.conTag > 10000 {
                    tagString = String(format: "%.1f万", Double(model.conTag) / 10000)
                } else {
                    tagString = "\(model.conTag)"
                }
                if tagString != "0" { tagLabel.text = "\(spinnerName ?? "总点击") \(tagString)" }
                orderView.isHidden = false
            }
        }
    }*/
    
    var indexPath: IndexPath? {
        didSet {
            guard let indexPath = indexPath else { return }
            if indexPath.row == 0 { orderView.image = UIImage.init(named: "paris") }
            else if indexPath.row == 1 { orderView.image = UIImage.init(named: "paris") }
            else if indexPath.row == 2 { orderView.image = UIImage.init(named: "paris") }
            else { orderView.image = nil }
        }
    }
    

}


