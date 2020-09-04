//
//  LoginVC.swift
//  MARU
//
//  Created by 오준현 on 2020/08/14.
//  Copyright © 2020 maru. All rights reserved.
//

import UIKit

import RxCocoa
import RxSwift

class LoginVC: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    var delegate: LoginDelegate?
    
    var isMain: Bool = true

    let closeButton = UIButton().then {
        $0.setImage(UIImage(named: "deleteIcon"), for: .normal)
        $0.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setTextField()
        setButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        navigationController?.navigationBar.isHidden = true
    }

    func setTextField(){
        idTextField.attributedPlaceholder =
            NSAttributedString(string: "아이디",
                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        passwordTextField.attributedPlaceholder =
            NSAttributedString(string: "비밀번호",
                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        idTextField.delegate = self
        passwordTextField.delegate = self

    }
    
    func setButton(){
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        loginButton.backgroundColor = .cornflowerBlue
        signUpButton.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
        
        view.addSubview(closeButton)
        closeButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(30)
            make.leading.equalToSuperview().offset(17)
            make.width.equalTo(16)
            make.height.equalTo(16)
        }

    }
    
    @objc func didTapCloseButton() {
        
        if isMain {
            self.dismiss(animated: true)
        }
        
        self.navigationController?.popViewController(animated: true)
    }

    @objc func didTapLoginButton(){
        
        signInService(idTextField?.text ?? "", passwordTextField?.text ?? "")
        
    }
    
    @objc func didTapSignUpButton(){
        let sb = UIStoryboard(name: "Login", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC

        navigationController?.navigationBar.backItem?.title = ""
        navigationController?.title = ""
        navigationController?.navigationItem.backBarButtonItem?.title = ""

        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - TextField
extension LoginVC: UITextFieldDelegate {
    
}

// MARK: - Server Connect
extension LoginVC {
    func signInService(_ id: String, _ password: String) {
        UserService.shared.signIn(id, password) { responsedata in
            
            switch responsedata {
                
            case .success(_):
                if self.isMain {
                    self.dismiss(animated: true)
                }
                
                self.delegate?.didLogin()
                self.navigationController?.popViewController(animated: true)

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

}

protocol LoginDelegate {
    func didLogin()
}
