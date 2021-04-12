//
//  grade.swift
//  NSTDemo
//
//  Created by 潘宣亦 on 2021/4/11.
//  Copyright © 2021 monoqle. All rights reserved.
//

import UIKit
import SnapKit
import AttributedString
import SwiftyStarRatingView


class grade:UIViewController{
    private var scroll = UIScrollView()
    private var content = UIView()
    private var image = UIImageView()
    private var label1 = UILabel()
    private var label2 = UILabel()
    private var label3 = UILabel()
    private var grade = UILabel()
    private var starRatingview = SwiftyStarRatingView()
    private var a="所犯错误"
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor=UIColor.white
        
        view.addSubview(scroll)
        scroll.snp.makeConstraints{(make) in
            make.edges.equalTo(view)}
        
        scroll.addSubview(content)
        content.snp.makeConstraints{(make) in
            make.top.bottom.equalTo(scroll)
            make.right.left.equalTo(view)
        }
        
        content.addSubview(image)
        image.image=UIImage(named:"paris")
        image.snp.makeConstraints{(make)in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(10)
            make.size.equalTo(200)
        }
        
        content.addSubview(label1)
        label1.font = UIFont.systemFont(ofSize: 20)
        label1.attributed.text = "你的笔画整体\("评分",.font(.systemFont(ofSize:30)))为："
        label1.snp.makeConstraints{(make)in
            make.top.equalTo(image.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(20)
        }
        
        
        
        content.addSubview(grade)
        grade.text="6"
        grade.font = UIFont.systemFont(ofSize: 80)
        grade.textColor = UIColor.systemPink
        grade.snp.makeConstraints{(make)in
            make.top.equalTo(label1.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(30)
            make.size.equalTo(100)
        }
        
        starRatingview.maximumValue = 5         //default is 5
        starRatingview.minimumValue = 0
        starRatingview.allowsHalfStars = true         //default is 0
        starRatingview.value = 3                //default is 0
        starRatingview.tintColor = UIColor.blue
            //starRatingview.addTarget(self, action: #selector(function), for: .valueChanged)
        content.addSubview(starRatingview)
        starRatingview.snp.makeConstraints{(make)in
            make.top.equalTo(grade).offset(20)
            make.left.equalTo(grade.snp.right).offset(10)
        }
        
        
        content.addSubview(label2)
        label2.numberOfLines=0
        label2.font = UIFont.systemFont(ofSize:20)
        label2.attributed.text = "运笔错误类型:\n    \("起收笔不规范",.font(.systemFont(ofSize:15)))"
        label2.snp.makeConstraints{(make)in
            make.top.equalTo(grade.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(20)
        
        }
        
        content.addSubview(label3)
        label3.numberOfLines=0
        label3.font = UIFont.systemFont(ofSize: 20)
        label3.attributed.text = "正确运笔方式:\n   \(a,.font(.systemFont(ofSize:15)))"
        label3.snp.makeConstraints{(make)in
            make.top.equalTo(label2.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(20)
        
        }
        
        
        
    }
    
    
    
    
}
