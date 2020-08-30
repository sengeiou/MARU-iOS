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
    @IBOutlet weak var idCheckImage: UIImageView!
    @IBOutlet weak var passwordCheckImage: UIImageView!
    @IBOutlet weak var passwordCertificationCheckImage: UIImageView!
    @IBOutlet weak var nicknameCheckImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTextField()
        setButton()
        setImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
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
        
        idTextField.delegate = self
        passwordTextField.delegate = self
        passwordCertificationTextField.delegate = self
        nameTextField.delegate = self
        
        idTextField.addTarget(self, action: #selector(checkIDTextField),
                              for: .editingChanged)
        nameTextField.addTarget(self, action: #selector(checkNickNameTextField),
                                for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(checkPasswordTextField),
                                for: .editingChanged)
        passwordCertificationTextField.addTarget(self, action: #selector(checkPasswordCertificationTextField),
                                for: .editingChanged)
    }

    
    func setButton(){
        signUpButton.backgroundColor = .cornflowerBlue
        signUpButton.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
    }
    
    func setImage(){
        idCheckImage.alpha = 0
        passwordCheckImage.alpha = 0
        passwordCertificationCheckImage.alpha = 0
        nicknameCheckImage.alpha = 0
    }

    @objc func didTapSignUpButton(){
        
        signUpService(idTextField.text ?? "",
                      passwordTextField.text ?? "",
                      nameTextField.text ?? "")
    }

}

extension SignUpVC: UITextFieldDelegate {
    @objc func checkIDTextField(_ textField: UITextField) {
        if textField.text?.validateID() == true {
            checkIDService(textField.text ?? "")
        }
    }
    
    @objc func checkNickNameTextField(_ textField: UITextField) {
        checkNickNameService(textField.text ?? "")
    }
    
    @objc func checkPasswordTextField(_ textField: UITextField) {
        if passwordTextField.text?.count ?? 0 > 8 {
            passwordCheckImage.alpha = 1
        } else {
            passwordCheckImage.alpha = 0
        }
    }
    
    @objc func checkPasswordCertificationTextField(_ textField: UITextField) {
        if passwordCertificationTextField.text == passwordTextField.text {
            passwordCertificationCheckImage.alpha = 1
            passwordCheckImage.alpha = 1
        } else if passwordTextField.text?.count ?? 0 > 8 {
            passwordCheckImage.alpha = 1
            passwordCertificationCheckImage.alpha = 0
        } else {
            passwordCheckImage.alpha = 0
            passwordCertificationCheckImage.alpha = 0

        }
    }
}

extension SignUpVC {
    
    func signUpService(_ id: String, _ password: String, _ name: String) {
        UserService.shared.signUp(id, password, name) { responsedata in
            
            switch responsedata {
                
            case .success(_):

                
                self.navigationController?.popToRootViewController(animated: true)

            case .requestErr(let res):
                
                print(res)

            case .pathErr:
                print(".pathErr")
                
            case .serverErr:
                
                print(".serverErr")
                
            case .networkFail :
                
                print("failure")
                
            }
        }
        
    }
    
    func checkIDService(_ id: String) {
        UserService.shared.checkID(id) { responsedata in
            
            switch responsedata {
                
            case .success(_):
                
                self.idCheckImage.alpha = 1
                
            case .requestErr(_):
                
                self.idCheckImage.alpha = 0

            case .pathErr:
                
                self.idCheckImage.alpha = 0

            case .serverErr:
                
                self.idCheckImage.alpha = 0

            case .networkFail :
                
                self.idCheckImage.alpha = 0

            }
        }
        
    }
    
    func checkNickNameService(_ name: String) {
        UserService.shared.checkNick(name) { responsedata in
            
            switch responsedata {
                
            case .success(_):
                
                self.nicknameCheckImage.alpha = 1
                
            case .requestErr(_):
                
                self.nicknameCheckImage.alpha = 0

            case .pathErr:

                self.nicknameCheckImage.alpha = 0

            case .serverErr:
                
                self.nicknameCheckImage.alpha = 0

            case .networkFail :
                
                self.nicknameCheckImage.alpha = 0

            }
        }
        
    }

}
