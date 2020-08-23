//
//  CreateVC.swift
//  MARU
//
//  Created by 이윤진 on 2020/08/21.
//  Copyright © 2020 maru. All rights reserved.
//

import UIKit

class CreateVC: UIViewController{
    
    var numbering: [String] = ["Quiz1","Quiz2","Quiz3","Quiz4","Quiz5"]
    @IBOutlet weak var CreateTV: UITableView! // 퀴즈 테이블뷰
    @IBOutlet weak var introTextView: UITextView! // 한 줄 소개
    @IBOutlet weak var introInfoView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let nibName = UINib(nibName: "CreateTVCell", bundle: nil)
        CreateTV.register(nibName, forCellReuseIdentifier: "CreateTVCell")
        CreateTV.delegate = self
        CreateTV.dataSource = self
        CreateTV.separatorStyle = UITableViewCell.SeparatorStyle.none
        introTextView.delegate = self
        introTextView.text = "토론에 대한 소개를 70자 이내로 입력해주세요"
        introTextView.textColor = UIColor.lightGray
        introTextView.layer.borderWidth = 1.0
        introTextView.layer.borderColor = UIColor.lightGray.cgColor
        introTextView.layer.cornerRadius = 8.0
        
        introInfoView.layer.cornerRadius = 8.0
        introInfoView.layer.shadowColor = UIColor.black.cgColor
        introInfoView.layer.shadowOffset = CGSize(width: 0, height: 0)
        introInfoView.layer.shadowRadius = 8.0
        introInfoView.layer.shadowOpacity = 0.2
        introInfoView.layer.shadowPath = UIBezierPath(roundedRect: introInfoView.bounds, cornerRadius: introInfoView.layer.cornerRadius).cgPath
    }
    
}

extension CreateVC: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbering.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CreateTVCell", for: indexPath) as! CreateTVCell
        cell.quizNumber.text = numbering[indexPath.row]
        cell.quizTextView.delegate = self
        cell.quizTextView.text = "퀴즈를 70자 이내로 입력해주세요."
        cell.quizTextView.textColor = UIColor.lightGray
        cell.quizTextView.layer.borderWidth = 1.0
        cell.quizTextView.layer.borderColor = UIColor.lightGray.cgColor
        cell.quizTextView.layer.cornerRadius = 8.0
        //cell.shadowView.layer.cornerRadius = 10.0
        // 셀 선택 시 흰색으로 설정
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.white
        cell.selectedBackgroundView = bgColorView
        return cell
    }
    
}

// MARK: - textview placeholder(회색글씨부분)
extension CreateVC: UITextViewDelegate{
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if introTextView.textColor == UIColor.lightGray{
            introTextView.text = nil
            introTextView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        if introTextView.text.isEmpty {
            introTextView.text = "토론에 대한 소개를 70자 이내로 입력해주세요"
            introTextView.textColor = UIColor.lightGray
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n"{
            introTextView.resignFirstResponder()
        }
        return true
    }
    
}

