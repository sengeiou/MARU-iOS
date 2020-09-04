//
//  Tabbar.swift
//  MARU
//
//  Created by 오준현 on 2020/08/14.
//  Copyright © 2020 maru. All rights reserved.
//

import UIKit

import SwiftKeychainWrapper

class Tabbar: UITabBarController {
    
    var token = KeychainWrapper.standard.string(forKey: Keychain.token.rawValue)
    
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

extension Tabbar : UITabBarControllerDelegate {
    
    
    func tabBarController(_ tabBarController: UITabBarController,
                          shouldSelect viewController: UIViewController) -> Bool {
        token = KeychainWrapper.standard.string(forKey: Keychain.token.rawValue)
        
        if token == nil || token == "" {
            
            loginAlert(title: "서비스 이용을 위해 로그인이 필요합니다.",
                       msg: "",
                       handler:
                { (action) in
                    let sb = UIStoryboard(name: "Login", bundle: nil)
                    let vc = sb.instantiateViewController(withIdentifier: "LoginNavigationController")
                        as! LoginNavigationController
                    vc.modalPresentationStyle = .overFullScreen

                    self.present(vc, animated: true)
                    
            })
            return false
        }
        
        return true
    }
}

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
