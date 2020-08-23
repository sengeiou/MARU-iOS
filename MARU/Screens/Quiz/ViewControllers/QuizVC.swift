//
//  QuizVC.swift
//  MARU
//
//  Created by 오준현 on 2020/08/14.
//  Copyright © 2020 maru. All rights reserved.
//

import UIKit

class QuizVC: UIViewController {
    
    //MARK: - UIComponents
    
    let backgroundView = UIView().then {
        $0.backgroundColor = .gray
    }
    let quizView = UIView().then {
        $0.backgroundColor = .yellow
    }
    let quizFirstCircleLabel = UILabel().then {
        $0.backgroundColor = .blue
    }
    let quizSecondCircleLabel = UILabel().then {
        $0.backgroundColor = .blue
    }
    let quizThirdCircleLabel = UILabel().then {
        $0.backgroundColor = .blue
    }
    let quizFourthCircleLabel = UILabel().then {
        $0.backgroundColor = .blue
    }
    let quizFifthCircleLabel = UILabel().then {
        $0.backgroundColor = .blue
    }
    
    let quizTextLabel = UILabel().then {
        $0.text = "Quiz 1"
        $0.font = UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.medium)
    }
    let quizSequenceLabel = UILabel().then {
        $0.text = "1 of 5"
        $0.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.semibold)
    }
    let stopwatchLabel = UILabel().then {
        $0.backgroundColor = .red
    }
    
    let quizContent = UILabel().then {
        $0.text = "자신과의 관계에서 생겨나는 감정은 고독이다."
        $0.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.light)
        $0.textAlignment = .left
    }
    
    let correctLabel = UILabel().then {
        $0.backgroundColor = .blue
    }
    
    let incorrectLabel = UILabel().then {
        $0.backgroundColor = .red
    }
    let contentView = UILabel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
}
