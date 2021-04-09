//
//  main.swift
//  NSTDemo
//
//  Created by 潘宣亦 on 2021/3/15.
//  Copyright © 2021 monoqle. All rights reserved.
//

import UIKit


class TabView:UITabBarController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.isTranslucent = false
        let onePageVC = home()
        
        addChildViewController(onePageVC,
                               title: "首页",
                               image: UIImage(named:"tab_home"),
                               selectedImage: UIImage(named:"tab_home_S"))
        let classVC = ViewController()
        addChildViewController(classVC,
                               title: "分类",
                               image: UIImage(named: "tab_class"),
                               selectedImage: UIImage(named: "tab_class_S"))
    }
    
    

func addChildViewController(_ childController: UIViewController, title:String?, image:UIImage? ,selectedImage:UIImage?) {
    
    //childController.title = title
    childController.tabBarItem = UITabBarItem(title: nil,
                                              image: image?.withRenderingMode(.alwaysOriginal),
                                              selectedImage: selectedImage?.withRenderingMode(.alwaysOriginal))
    
    if UIDevice.current.userInterfaceIdiom == .phone {
        childController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
    }
    addChild(Navigationcontroller(rootViewController: childController))
}
    
}

extension TabView {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        guard let select = selectedViewController else { return .lightContent }
        return select.preferredStatusBarStyle
    }
}
