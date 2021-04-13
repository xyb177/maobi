//
//  blueteeth.swift
//  NSTDemo
//
//  Created by 潘宣亦 on 2021/4/13.
//  Copyright © 2021 monoqle. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class blueteeth : UIViewController{
    private var tableview = UITableView()
    private var label = UILabel()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
    
        self.tableview.delegate = self
        self.tableview.dataSource = self
        
        
        view.addSubview(self.tableview)
        tableview.snp.makeConstraints {
            $0.edges.equalTo(self.view.usnp.edges).priority(.low)
            $0.top.equalToSuperview()
            
        }
        self.tableview.register(cellType: Ccell.self)
        self.tableview.tableFooterView = UIView.init(frame: CGRect.zero)
        
        view.addSubview(label)
        label.text="测试设备"
        label.snp.makeConstraints{
            $0.top.equalToSuperview().offset(200)
        }
       
        
    }
    
    
    
}

extension blueteeth: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2

     }
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: Ccell.self)
             return cell
     
     
     

     }}

