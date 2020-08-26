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
    
    var answer: Int = 0 // 정답 1 오답 0
    override func awakeFromNib() {
        super.awakeFromNib()
        self.shadowView.layer.cornerRadius = 10.0
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    @IBAction func correctBtnTouched(_ sender: Any) {
        answer = 1
        correctBtn.setImage(UIImage(named: "correctBlue"), for: .normal)
        incorrectBtn.setImage(UIImage(named:"incorrectWhite"),for: .normal)
        
    }
    
    @IBAction func incorrectBtnTouched(_ sender: Any) {
        answer = 0
        incorrectBtn.setImage(UIImage(named: "incorrectWhite52"), for: .normal)
        correctBtn.setImage(UIImage(named: "correctBlue52"), for: .normal)
    }
}

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
}
