//
//  SecondQuizVC.swift
//  MARU
//
//  Created by psychehose on 2020/08/30.
//  Copyright © 2020 maru. All rights reserved.
//

import UIKit

class FourthQuizVC: UIViewController {
    
    //MARK: - UIComponents
    
    let backgroundView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.borderWidth = 0.5
        $0.layer.cornerRadius = 5
        $0.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        $0.layer.masksToBounds = false
        $0.layer.shadowColor = UIColor.black.cgColor
        
        $0.layer.shadowOffset = .zero
        $0.layer.shadowRadius = 1.5
        $0.layer.shadowOpacity = 0.2
        $0.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
    }
    let quizView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.borderWidth = 0.5
        $0.layer.cornerRadius = 5
        $0.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        $0.layer.masksToBounds = false
        $0.layer.shadowColor = UIColor.black.cgColor
        
        $0.layer.shadowOffset = .zero
        $0.layer.shadowRadius = 1.5
        $0.layer.shadowOpacity = 0.28
        $0.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
    }
    let quizFirstCheckImageView = UIImageView().then {
        $0.image = UIImage(named: "circleGray")
        $0.contentMode = .center
    }
    let quizSecondCheckImageView = UIImageView().then {
        $0.image = UIImage(named: "circleGray")
        $0.contentMode = .center
    }
    let quizThirdCheckImageView = UIImageView().then {
        $0.image = UIImage(named: "circleGray")
        $0.contentMode = .center
    }
    let quizFourthCheckImageView = UIImageView().then {
        $0.image = UIImage(named: "circleGray")
        $0.contentMode = .center
    }
    let quizFifthCheckImageView = UIImageView().then {
        $0.image = UIImage(named: "circleGray")
        $0.contentMode = .center
    }
    
    let quizTextLabel = UILabel().then {
        $0.text = "Quiz 4"
        $0.font = UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.medium)
    }
    let quizSequenceLabel = UILabel().then {
        $0.text = "4 of 5"
        $0.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.semibold)
    }
    let stopwatchView = UIView().then {
        $0.backgroundColor = .white
    }
    
    let quizContent = UILabel().then {
        $0.text = "타인이 나를 알아주지 않을 때 드는 감정 은 외로움이고, 내가 나 자신을 알아주지 않을 때 드는 감정은 고독이다. 가나다라마바사"
        $0.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.light)
        $0.textAlignment = .center
        $0.numberOfLines = 4
    }
    
    let correctButton = UIButton().then {
        
        $0.setImage(UIImage(named: "correctWhite"), for: .normal)
    }
    
    let incorrectButton = UIButton().then {
        $0.setImage(UIImage(named: "incorrectWhite"), for:.normal)
    }
    
    let timeLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 13)
    }
    let strokeIt = CABasicAnimation(keyPath: "strokeEnd")
    let contentView = UIView()
    let timeLeftShapeLayer = CAShapeLayer()
    let bgShapeLayer = CAShapeLayer()
    
    //MARK: - Properties
    
    var stateNumber = 1
    var timeLeft: TimeInterval = 30
    var endTime: Date?
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        setTouchImage()
        
    }
    
}

extension FourthQuizVC {
    func setTouchImage() {
        correctButton.addTarget(self, action: #selector(didTapCorrectButton), for: .touchUpInside)
        incorrectButton.addTarget(self, action: #selector(didTapIncorrectButton), for: .touchUpInside)
        
    }
    @objc func didTapCorrectButton() {
        correctButton.setImage(UIImage(named: "correctBlue"),for: .normal)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            
            guard let nextQuizVC = self.storyboard?.instantiateViewController(withIdentifier: "FifthQuizVC") as? FifthQuizVC else { return }
            nextQuizVC.modalPresentationStyle = .fullScreen

            self.present(nextQuizVC,animated: true,completion: nil)
            
        })
        
//        guard let nextQuizVC = self.storyboard?.instantiateViewController(withIdentifier: "FifthQuizVC") as? FifthQuizVC else { return }
//
//        nextQuizVC.modalPresentationStyle = .fullScreen
//        self.present(nextQuizVC,animated: true,completion: nil)
        
        
    }
    @objc func didTapIncorrectButton() {
        incorrectButton.setImage(UIImage(named: "incorrectRed"),for: .normal)
        
        
        
        
        
    }
}
