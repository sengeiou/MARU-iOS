//
//  SignUpVC.swift
//  MARU
//
//  Created by 오준현 on 2020/08/22.
//  Copyright © 2020 maru. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordCertificationTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTextField()
        setButton()

    }
//    박세연
//    고병우
//    차희주
//    김희재
    
    func setTextField(){
        idTextField.attributedPlaceholder =
            NSAttributedString(string: "아이디",
                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        passwordTextField.attributedPlaceholder =
            NSAttributedString(string: "비밀번호",
                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        passwordCertificationTextField.attributedPlaceholder =
            NSAttributedString(string: "비밀번호 확인",
                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        nameTextField.attributedPlaceholder =
            NSAttributedString(string: "닉네임",
                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }

    
    func setButton(){
        signUpButton.backgroundColor = .cornflowerBlue
        signUpButton.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
    }

    @objc func didTapSignUpButton(){
        let sb = UIStoryboard(name: "Login", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        
        navigationController?.pushViewController(vc, animated: true)
    }

}
