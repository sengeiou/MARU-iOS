//
//  SearchEntryMoimVC.swift
//  MARU
//
//  Created by 이윤진 on 2020/08/17.
//  Copyright © 2020 maru. All rights reserved.
//

import UIKit

class SearchEntryMoimVC: UIViewController{
   
    @IBOutlet weak var shadowImageView: UIView! // 그림자 이미지
    @IBOutlet weak var entryBookImage: UIImageView! // 책 표지 이미지
    @IBOutlet weak var entryBookTitle: UILabel! // 책 제목
    @IBOutlet weak var entryBookAuthor: UILabel! // 책 작가
    @IBOutlet weak var entryLeftTime: UILabel! // 토론방 활성화 남은 시간
    @IBOutlet weak var entryMoimZzang: UILabel! // 토론방 짱
    @IBOutlet weak var entryScoreLabel: UILabel! // 평균 평점
    @IBOutlet weak var entryMoimPerson: UILabel! // 현재 참여 인원
    @IBOutlet weak var entryIntroLabel: UILabel! // 한 줄 평
    var roomIdx: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(roomIdx)")
        // MARK: - boxview shadow attributes
        shadowImageView.layer.cornerRadius = 10.0
        shadowImageView.layer.shadowColor = UIColor.black.cgColor
        shadowImageView.layer.shadowOffset = CGSize(width: 0, height: 0)
        shadowImageView.layer.shadowRadius = 10.0
        shadowImageView.layer.shadowOpacity = 0.3
        shadowImageView.layer.shadowPath = UIBezierPath(roundedRect: shadowImageView.bounds, cornerRadius: shadowImageView.layer.cornerRadius).cgPath
        // 임의코드
        self.entryBookTitle.text = "운다고 달라지는 일은 아무것도 없겠지만"
    }
    //MARK: - 네비게이션바 숨겼다가 재등장
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
       
        //        navigationController?.navigationBar.isTranslucent = true
        //        navigationController?.view.backgroundColor = .clear
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationController?.navigationItem.leftBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        navigationController?.setNavigationBarHidden(false, animated: animated)
        
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}

