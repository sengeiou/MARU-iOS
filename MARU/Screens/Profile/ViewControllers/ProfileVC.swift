//
//  ProfileVC.swift
//  MARU
//
//  Created by 오준현 on 2020/08/14.
//  Copyright © 2020 maru. All rights reserved.
//

import UIKit

import SwiftKeychainWrapper
import SnapKit


class ProfileVC: UIViewController {
    
    // MARK: - UI components
    
    @IBOutlet weak var profileTableView: UITableView!
    
    
    // MARK: - Variables and Properties
    
    var token: String?
    var profile: Profile?
    var delegate: LoginDelegate?

    // MARK: - Dummy Data
    
    var data: [String] = ["이용약관","오픈소스 라이선스"]

    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        profileService()
        
        navigationController?.navigationBar.isHidden = true
        
        token = KeychainWrapper.standard.string(forKey: Keychain.token.rawValue) ?? ""
        if token != "" {
            data = ["로그아웃","이용약관","오픈소스 라이선스"]
            profileService()
        }
    }
        
}

// MARK: - Helper

extension ProfileVC {
    func setTableView(){
        profileTableView.delegate = self
        profileTableView.dataSource = self
        profileTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        profileTableView.isScrollEnabled = false
        profileTableView.register(ProfileTVCell.self, forCellReuseIdentifier: "ProfileTVCell")
    }
}

extension ProfileVC: UITableViewDelegate {}

extension ProfileVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = ProfileView()
        
        view.rootVC = self
        
        if token == "" {
            view.toLoginView()
        } else {
            view.data = profile
            view.setView()
        }
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 184
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54.5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTVCell",
                                                 for: indexPath) as! ProfileTVCell
        
        cell.textLabel?.text = data[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        cell.setCell()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch data[indexPath.row] {

        case "로그아웃":
            KeychainWrapper.standard.removeAllKeys()
            
            token = KeychainWrapper.standard.string(forKey: Keychain.token.rawValue) ?? ""
                    
            if token != "" {
                data = ["로그아웃","이용약관","오픈소스 라이선스"]

            } else {
                data = ["이용약관","오픈소스 라이선스"]
            }
            
            tableView.reloadData()

        case "이용약관":
            print(222)
            
        case "오픈소스 라이선스":
            print(333)
            
        case "회원탈퇴":
            print(444)

        default:
            print("default")
        }
    }
    
    
}

extension ProfileVC {
    func profileService() {
        print(#function)
        UserService.shared.profile() { responsedata in
            
            switch responsedata {
                
            case .success(let response):
                let res = response as! ResponseSimpleResult<Profile>
                self.profile = res.data
                KeychainWrapper.standard.set(self.profile?.nickName ?? "",
                                             forKey: Keychain.name.rawValue)
                self.profileTableView.reloadData()
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
    
    func signOut() {
        UserService.shared.signOut("123") { responsedata in
            
            switch responsedata {
                
            case .success(let response):
                _ = response as! ResponseTempResult
                KeychainWrapper.standard.removeAllKeys()
                
                self.token != "" ? (self.data = ["로그아웃","이용약관","오픈소스 라이선스"]) : (self.data = ["이용약관","오픈소스 라이선스"])
                
                self.profileTableView.reloadData()
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

extension ProfileVC: LoginDelegate {
    func didLogin() {
        data = ["로그아웃","이용약관","오픈소스 라이선스","회원탈퇴"]
        profileService()
    }
}
