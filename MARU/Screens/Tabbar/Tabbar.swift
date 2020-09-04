//
//  Tabbar.swift
//  MARU
//
//  Created by 오준현 on 2020/08/14.
//  Copyright © 2020 maru. All rights reserved.
//

import UIKit

class Tabbar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setupStyle()
    }
    
    func setupStyle() {
        UITabBar.clearShadow()
        self.tabBar.layer.applyShadow(color: .black, alpha: 0.3, x: 0, y: 0, blur: 12)
    }
    
}

extension Tabbar : UITabBarControllerDelegate { }

extension CALayer {
    func applyShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blur: CGFloat = 4
    ) {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
    }

}
