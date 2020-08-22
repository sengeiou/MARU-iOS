//
//  LoginVC.swift
//  MARU
//
//  Created by 오준현 on 2020/08/14.
//  Copyright © 2020 maru. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextField()
        setButton()
        setNavigationController()
    }

    func setTextField(){
        idTextField.attributedPlaceholder =
            NSAttributedString(string: "아이디",
                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        passwordTextField.attributedPlaceholder =
            NSAttributedString(string: "비밀번호",
                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    
    func setButton(){
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        loginButton.backgroundColor = .cornflowerBlue
        signUpButton.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
    }
    
    func setNavigationController(){
        navigationController?.navigationBar.setBackgroundImage(UIImage(),
                                                               for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }

    @objc func didTapLoginButton(){
    }
    
    @objc func didTapSignUpButton(){
        let sb = UIStoryboard(name: "Login", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
