//
//  test.swift
//  NSTDemo
//
//  Created by 潘宣亦 on 2021/3/15.
//  Copyright © 2021 monoqle. All rights reserved.
//

import UIKit
import SnapKit


class home: UIViewController {
    private var scroll = UIScrollView()
    private var content = UIView()
    private var image = UIImageView()
    private var tabel = UITableView()
    private lazy var searchButton: UIButton = {
        let sn = UIButton(type: .system)
        sn.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 20, height: 30)
        sn.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        sn.layer.cornerRadius = 15
        sn.setTitleColor(.white, for: .normal)
        sn.setImage(UIImage(named: "nav_search")?.withRenderingMode(.alwaysOriginal), for: .normal)
        sn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        sn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
        sn.addTarget(self, action:#selector(searchAction), for: .touchUpInside)
        return sn
    }()
   
     var resultTableView = UITableView()
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        guard let navi = navigationController else { return }
        if navi.visibleViewController == self {
            navi.barStyle(.theme)}
        navigationItem.titleView = searchButton
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: nil,style: .plain,target: nil,action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: nil,style: .plain,target: nil,action: nil)
      
                self.resultTableView.delegate = self
                self.resultTableView.dataSource = self
                self.view .addSubview(self.resultTableView)
        resultTableView.snp.makeConstraints { $0.edges.equalTo(self.view.usnp.edges) }
                self.resultTableView.register(cellType: UComicTCell.self)
        self.resultTableView = UITableView.init(frame: self.view.bounds, style: UITableView.Style.plain)
                self.resultTableView.tableFooterView = UIView.init()
    }
    
    
    
    
    
    @objc private func searchAction() {
        navigationController?.pushViewController(SearchView(), animated: true)
    }

    }
    
   
extension home: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10

     }
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: UComicTCell.self)
             return cell
     
     
     

     }}

extension UIView {

    var usnp: ConstraintBasicAttributesDSL {
        if #available(iOS 13.0, *) {
            return self.safeAreaLayoutGuide.snp
        } else {
            return self.snp
        }
    }
}
