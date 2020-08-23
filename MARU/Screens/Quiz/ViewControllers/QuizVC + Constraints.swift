//
//  QuizVC + Constraint.swift
//  MARU
//
//  Created by psychehose on 2020/08/24.
//  Copyright © 2020 maru. All rights reserved.
//

import UIKit

extension QuizVC {
    
    func layout() {
        
        self.view.addSubview(contentView)
        self.contentView.addSubview(quizFirstCircleLabel)
        self.contentView.addSubview(quizSecondCircleLabel)
        self.contentView.addSubview(quizThirdCircleLabel)
        self.contentView.addSubview(quizFourthCircleLabel)
        self.contentView.addSubview(quizFifthCircleLabel)
        
        self.contentView.addSubview(correctLabel)
        self.contentView.addSubview(incorrectLabel)
        self.contentView.addSubview(backgroundView)
        
        self.backgroundView.addSubview(quizView)
        self.quizView.addSubview(quizTextLabel)
        self.quizView.addSubview(quizSequenceLabel)
        self.quizView.addSubview(stopwatchLabel)
        self.quizView.addSubview(quizContent)

        
        contentView.snp.makeConstraints{ ( make ) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        correctLabel.snp.makeConstraints{ ( make ) in
            make.leading.equalTo(contentView.snp.leading).inset(79)
            make.bottom.equalTo(contentView.snp.bottom).inset(124)
            make.width.equalTo(89)
            make.height.equalTo(89)
        }
        incorrectLabel.snp.makeConstraints{ ( make ) in
            make.trailing.equalTo(contentView.snp.trailing).inset(78)
            make.bottom.equalTo(contentView.snp.bottom).inset(124)
            make.width.equalTo(89)
            make.height.equalTo(89)
        }
        
        backgroundView.snp.makeConstraints{ ( make ) in
            make.leading.equalTo(contentView.snp.leading).inset(43)
            make.trailing.equalTo(contentView.snp.trailing).inset(23)
            make.bottom.equalTo(correctLabel.snp.top).inset(-60)
            make.height.equalTo(280)
        }
        quizFirstCircleLabel.snp.makeConstraints{ ( make ) in
            make.leading.equalTo(contentView.snp.leading).inset(101)
            make.bottom.equalTo(backgroundView.snp.top).inset(-33)
            make.width.equalTo(31)
            make.height.equalTo(31)
        }
        quizSecondCircleLabel.snp.makeConstraints{ ( make ) in
            make.leading.equalTo(quizFirstCircleLabel.snp.trailing).inset(-4)
            make.bottom.equalTo(backgroundView.snp.top).inset(-33)
            make.width.equalTo(31)
            make.height.equalTo(31)
        }
        quizThirdCircleLabel.snp.makeConstraints{ ( make ) in
            make.leading.equalTo(quizSecondCircleLabel.snp.trailing).inset(-4)
            make.bottom.equalTo(backgroundView.snp.top).inset(-33)
            make.width.equalTo(31)
            make.height.equalTo(31)
        }
        quizFourthCircleLabel.snp.makeConstraints{ ( make ) in
            make.leading.equalTo(quizThirdCircleLabel.snp.trailing).inset(-4)
            make.bottom.equalTo(backgroundView.snp.top).inset(-33)
            make.width.equalTo(31)
            make.height.equalTo(31)
        }
        quizFifthCircleLabel.snp.makeConstraints{ ( make ) in
            make.leading.equalTo(quizFourthCircleLabel.snp.trailing).inset(-4)
            make.bottom.equalTo(backgroundView.snp.top).inset(-33)
            make.width.equalTo(31)
            make.height.equalTo(31)
        }

        
        quizView.snp.makeConstraints{ ( make ) in
            make.leading.equalTo(backgroundView.snp.leading).inset(-10)
            make.top.equalTo(backgroundView.snp.top).inset(-10)
            make.height.equalTo(backgroundView.snp.height)
            make.width.equalTo(backgroundView.snp.width)
        }
//        quizTextLabel.snp.makeConstraints{ ( make ) in
//            make.leading.equalTo(backgroundView.snp.leading).inset(22)
//            make.top.equalTo(quizView.snp.top).inset(21)
//            make.height.equalTo(29)
//            make.width.equalTo(68)
//        }
//        quizSequenceLabel.snp.makeConstraints{ ( make ) in
//            make.leading.equalTo(quizTextLabel.snp.trailing).inset(-11)
//            make.top.equalTo(quizView.snp.top).inset(28)
//            make.height.equalTo(34)
//            make.width.equalTo(16)
//        }
//        quizSequenceLabel.snp.makeConstraints{ ( make ) in
//            make.trailing.equalTo(quizView.snp.trailing).inset(20)
//            make.top.equalTo(quizView.snp.top).inset(23)
//            make.height.equalTo(31)
//            make.width.equalTo(31)
//        }
//        
    
        
        
        
        
        
        
    }
    
}

