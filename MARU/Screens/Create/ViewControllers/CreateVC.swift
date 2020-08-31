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
        introTextView.placeholder = "토론에 대한 소개를 70자 이내로 입력해주세요"
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
        introTextView.returnKeyType = .done

      


    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
    
    // 키보드 바깥 뷰 아무데나 터치하면 키보드 다시 들어가는 코드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
}

// MARK: - Tableview setting
extension CreateVC: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbering.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CreateTVCell", for: indexPath) as! CreateTVCell
        cell.quizNumber.text = numbering[indexPath.row]
        cell.quizTextView.delegate = self
        cell.quizTextView.placeholder = "퀴즈를 70자 이내로 입력해주세요."
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
            introTextView.text = "토론에 대한 소개를 70자 이내로 입력해주세요."
            introTextView.textColor = UIColor.lightGray
        }
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n"{
            introTextView.resignFirstResponder()
        }
        return true
    }
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        introTextView.resignFirstResponder()
        return true
    }
    func keyboardWillShow(_ sender: Notification) {

        self.view.frame.origin.y = -150 // Move view 150 points upward

    }

    func keyboardWillHide(_ sender: Notification){
        self.view.frame.origin.y = 0
    }
 
}
