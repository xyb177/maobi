//
//  test2.swift
//  NSTDemo
//
//  Created by 潘宣亦 on 2021/3/15.
//  Copyright © 2021 monoqle. All rights reserved.
//

import Foundation
import UIKit
import SnapKit


class SearchView: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let scrollView = UIScrollView()
        self.view.addSubview(scrollView)
        scrollView.snp.makeConstraints{(make) in
            make.edges.equalToSuperview()
            
        }
       
        
    }
}
