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
import QuickLookThumbnailing

class ProfileVC: UIViewController {

    // MARK: - UI components

    @IBOutlet weak var profileTableView: UITableView!
    
    
    // MARK: - Variables and Properties

    
    
    // MARK: - Dummy Data

    var data: [String] = ["로그아웃","이용약관","오픈소스 라이선스","회원탈퇴"]

    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
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
        
//        view.setView()
        view.toLoginView()

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
    
    
}
