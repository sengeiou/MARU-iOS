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
    @IBOutlet weak var entryBookImage: UIImageView! // 책 표지 이미지(thumbnail)
    @IBOutlet weak var entryBookTitle: UILabel! // 책 제목(title)
    @IBOutlet weak var entryBookAuthor: UILabel! // 책 작가(authors)
    @IBOutlet weak var entryLeftTime: UILabel! // 토론방 활성화 남은 시간
    @IBOutlet weak var entryMoimZzang: UILabel! // 토론방 짱(nickName)
    @IBOutlet weak var entryScoreLabel: UILabel! // 평균 평점(avgRating)
    @IBOutlet weak var entryMoimPerson: UILabel! // 현재 참여 인원(peoplecount)
    @IBOutlet weak var entryIntroLabel: UILabel! // 한 줄 평(info)
    @IBOutlet weak var quizButton: UIButton!
    
    var roomIdx: Int?
    var moimInfoResult: [MoimInfoResult]?
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(roomIdx ?? 0)")
        // MARK: - boxview shadow attributes
        shadowImageView.layer.cornerRadius = 10.0
        shadowImageView.layer.shadowColor = UIColor.black.cgColor
        shadowImageView.layer.shadowOffset = CGSize(width: 0, height: 0)
        shadowImageView.layer.shadowRadius = 10.0
        shadowImageView.layer.shadowOpacity = 0.3
        shadowImageView.layer.shadowPath = UIBezierPath(roundedRect: shadowImageView.bounds, cornerRadius: shadowImageView.layer.cornerRadius).cgPath
        quizButton.addTarget(self, action: #selector(didTapQuizButton), for: .touchUpInside)
        
    }
    
    //MARK: - 네비게이션바 숨겼다가 재등장
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationController?.navigationItem.leftBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        navigationController?.setNavigationBarHidden(false, animated: animated)
        moimInfo(roomIdx ?? 0)
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @objc func didTapQuizButton() {
        
        let sb = UIStoryboard(name: "QuizVC", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "FirstQuizVC") as! FirstQuizVC
        
        // 여기에 해당 방 번호 넣어주세요
        vc.roomIndex = 1
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension SearchEntryMoimVC {
    
    func moimInfo(_ roomIdx: Int){
        
        EntryMoimInfoService.shared.entryMoimInfoService(roomIdx){ responseData in switch responseData{
        case .success(let response):
            let resp = response as! [MoimInfoResult]
            print("무슨값이지\(resp)")
            let res = resp[0]
            print("\(res)")
            self.entryBookImage.imageFromUrl(res.thumbnail, defaultImgPath: "")
            self.entryBookTitle.text = res.title
            self.entryBookAuthor.text = res.authors
            self.entryMoimZzang.text = res.nickName
            self.entryScoreLabel.text = res.avgRating
            self.entryMoimPerson.text = String(res.peopleCount)
            self.entryIntroLabel.text = res.info
            
            let originPostTime = res.createdAt
            let postTimeDateFormat = originPostTime.getDateFormat(time: originPostTime)
            self.entryLeftTime.text = postTimeDateFormat?.timeAgoSince(postTimeDateFormat!)
            print("남은일수\(postTimeDateFormat?.timeAgoSince(postTimeDateFormat!))")
            
            
        case .requestErr(_):
            print("request error")
            
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
