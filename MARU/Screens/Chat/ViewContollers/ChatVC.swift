//
//  ChatVC.swift
//  MARU
//
//  Created by 오준현 on 2020/08/14.
//  Copyright © 2020 maru. All rights reserved.
//

import UIKit

import Then
import SnapKit
import SwiftKeychainWrapper

struct Message {
    let name: String
    let message: String
}

class ChatVC: UIViewController {
    
    // MARK: - UI components
    
    let chatCollectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: UICollectionViewFlowLayout()).then
        {
            $0.backgroundColor = .white
            $0.allowsMultipleSelection = true
    }
    
    // MARK: - Variables and Properties
    
    
    // MARK: - Dummy Data
    
    let chatDummy: [Message] = [ Message.init(name: "최정균", message: "아이패드 사고싶어"),
                                 Message.init(name: "정효원", message: "맥북 사고싶어"),
                                 Message.init(name: "이예인", message: "조아여~~"),
                                 Message.init(name: "최현정", message: "오부장!"),
                                 Message.init(name: "최혜리", message: "큨"),
                                 Message.init(name: "오준현", message: "마시써~"),
                                 Message.init(name: "오준현", message: "마시써~"),
                                 Message.init(name: "최혜리", message: "큨"),
                                 Message.init(name: "최혜리", message: "큨"),
                                 Message.init(name: "최혜리", message: "큨"),
                                 Message.init(name: "최혜리", message: "큨"),
                                 Message.init(name: "최혜리", message: "큨"),
                                 Message.init(name: "오준현", message: "마시써~"),
                                 Message.init(name: "오준현", message: "마시써~"),
                                 Message.init(name: "오준현", message: "마시써~"),
                                 Message.init(name: "오준현", message: "마시써~"),
                                 Message.init(name: "오준현", message: "마시써~"),
                                 Message.init(name: "오준현", message: "마시써~"),
                                 Message.init(name: "오준현", message: "마시써~"),
                                 Message.init(name: "오준현", message: "마시써~"),
                                 Message.init(name: "오준현", message: "마시써~"),
                                 Message.init(name: "오준현", message: "마시써~")
    ]
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        constraint()
        collectionView()
        KeychainWrapper.standard.set("오준현", forKey: "id")
    }
    
}

// MARK: - Helper

extension ChatVC {
    func constraint() {
        view.addSubview(chatCollectionView)
        
        chatCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
    }
    
    func collectionView(){
        chatCollectionView.delegate = self
        chatCollectionView.dataSource = self
        chatCollectionView.prefetchDataSource = self
        chatCollectionView.register(ChatCVCell.self,
                                    forCellWithReuseIdentifier: Identifier.Chat)
        
    }
    
}

extension ChatVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: view.frame.width, height: 60)
    }
    
}

extension ChatVC: UICollectionViewDelegate { }
extension ChatVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return chatDummy.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.Chat,
                                                      for: indexPath) as! ChatCVCell
        
        cell.message = chatDummy[indexPath.row]
        cell.setConstraint()
        cell.find()
        
        return cell
    }
    
    
}

extension ChatVC: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {

    }
    

}
