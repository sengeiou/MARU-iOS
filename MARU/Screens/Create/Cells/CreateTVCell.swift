//
//  CreateTVCell.swift
//  MARU
//
//  Created by 이윤진 on 2020/08/22.
//  Copyright © 2020 maru. All rights reserved.
//

import UIKit

class CreateTVCell: UITableViewCell {
    
    @IBOutlet weak var shadowView: UILabel!
    @IBOutlet weak var quizNumber: UILabel!
    @IBOutlet weak var quizTextView: UITextView!
    @IBOutlet weak var correctBtn: UIButton!
    @IBOutlet weak var incorrectBtn: UIButton!
    
    var answer: String = "정답" // 정답 ox 스트링
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.shadowView.layer.cornerRadius = 10.0
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    // 키보드 바깥 뷰 아무데나 터치하면 키보드 다시 들어가는 코드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.endEditing(true)
    }
    @IBAction func correctBtnTouched(_ sender: Any) {
        answer = "O"
        correctBtn.setImage(UIImage(named: "correctBlue52"), for: .normal)
        incorrectBtn.setImage(UIImage(named:"incorrectWhite"),for: .normal)
        
    }
    
    @IBAction func incorrectBtnTouched(_ sender: Any) {
        answer = "X"
        incorrectBtn.setImage(UIImage(named: "incorrectWhite52"), for: .normal)
        correctBtn.setImage(UIImage(named: "correctWhite"), for: .normal)
    }
    
    func sendCell(){
        
    }
}
// MARK:- textview placeholder
extension CreateTVCell: UITextViewDelegate{
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if quizTextView.textColor == UIColor.lightGray{
            quizTextView.text = nil
            quizTextView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        if quizTextView.text.isEmpty {
            quizTextView.text = "퀴즈를 70자 이내로 입력해주세요."
            quizTextView.textColor = UIColor.lightGray
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n"{
            quizTextView.resignFirstResponder()
        }
        return true
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        quizTextView.resignFirstResponder()
        return true
    }
    func keyboardWillShow(_ sender: Notification) {
        
        self.frame.origin.y = -150 // Move view 150 points upward
        
    }
    
    func keyboardWillHide(_ sender: Notification){
        self.frame.origin.y = 0
    }
}
