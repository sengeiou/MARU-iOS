//
//  QuizVC + Constraint.swift
//  MARU
//
//  Created by psychehose on 2020/08/24.
//  Copyright © 2020 maru. All rights reserved.
//

import UIKit

extension FifthQuizVC {
    
    func layout() {
        
        self.view.addSubview(contentView)
        self.contentView.addSubview(quizFirstCheckImageView)
        self.contentView.addSubview(quizSecondCheckImageView)
        self.contentView.addSubview(quizThirdCheckImageView)
        self.contentView.addSubview(quizFourthCheckImageView)
        self.contentView.addSubview(quizFifthCheckImageView)
        
        self.contentView.addSubview(correctButton)
        self.contentView.addSubview(incorrectButton)
        self.contentView.addSubview(backgroundView)
        
        self.backgroundView.addSubview(quizView)
        self.quizView.addSubview(quizTextLabel)
        self.quizView.addSubview(quizSequenceLabel)
        self.quizView.addSubview(stopwatchView)
        self.quizView.addSubview(quizContent)
        self.stopwatchView.addSubview(timeLabel)
        
        
    
        contentView.snp.makeConstraints{ ( make ) in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.equalTo(self.view.safeAreaLayoutGuide)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        correctButton.snp.makeConstraints{ ( make ) in
            make.leading.equalTo(contentView.snp.leading).inset(79)
            make.bottom.equalTo(contentView.snp.bottom).inset(90)
            make.width.equalTo(self.view.frame.height * (0.109))
            make.height.equalTo(self.view.frame.height * (0.109))
        }
        
        incorrectButton.snp.makeConstraints{ ( make ) in
            make.trailing.equalTo(contentView.snp.trailing).inset(79)
            make.bottom.equalTo(contentView.snp.bottom).inset(90)
            make.width.equalTo(self.view.frame.height * (0.109))
            make.height.equalTo(self.view.frame.height * (0.109))
        }
        
        backgroundView.snp.makeConstraints{ ( make ) in
            make.leading.equalTo(contentView.snp.leading).inset(0.114 * self.view.frame.width)
            make.trailing.equalTo(contentView.snp.trailing).inset(0.061 * self.view.frame.width)
            make.bottom.equalTo(correctButton.snp.top).inset(-self.view.frame.height * 0.073)
            make.height.equalTo(0.344 * self.view.frame.height)
        }
        
        quizThirdCheckImageView.snp.makeConstraints{ ( make ) in
            make.centerX.equalTo(self.view.snp.centerX)
            make.bottom.equalTo(backgroundView.snp.top).inset(-25)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        quizSecondCheckImageView.snp.makeConstraints{ ( make ) in
            make.trailing.equalTo(quizThirdCheckImageView.snp.leading).inset(-2)
            make.bottom.equalTo(backgroundView.snp.top).inset(-25)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        quizFirstCheckImageView.snp.makeConstraints{ ( make ) in
            make.trailing.equalTo(quizSecondCheckImageView.snp.leading).inset(-2)
            make.bottom.equalTo(backgroundView.snp.top).inset(-25)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        quizFourthCheckImageView.snp.makeConstraints{ ( make ) in
            make.leading.equalTo(quizThirdCheckImageView.snp.trailing).inset(-2)
            make.bottom.equalTo(backgroundView.snp.top).inset(-25)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        quizFifthCheckImageView.snp.makeConstraints{ ( make ) in
            make.leading.equalTo(quizFourthCheckImageView.snp.trailing).inset(-2)
            make.bottom.equalTo(backgroundView.snp.top).inset(-25)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        quizView.snp.makeConstraints{ ( make ) in
            make.leading.equalTo(backgroundView.snp.leading).inset(-10)
            make.top.equalTo(backgroundView.snp.top).inset(-10)
            make.height.equalTo(backgroundView.snp.height)
            make.width.equalTo(backgroundView.snp.width)
        }
        quizTextLabel.snp.makeConstraints{ ( make ) in
            make.leading.equalTo(backgroundView.snp.leading).inset(22)
            make.top.equalTo(quizView.snp.top).inset(21)
            make.height.equalTo(30)
            make.width.equalTo(73)
        }
        quizSequenceLabel.snp.makeConstraints{ ( make ) in
            make.leading.equalTo(quizTextLabel.snp.trailing).inset(-7)
            make.top.equalTo(quizView.snp.top).inset(29)
            make.height.equalTo(16)
            make.width.equalTo(37)
        }
        stopwatchView.snp.makeConstraints{ ( make ) in
            make.trailing.equalTo(quizView.snp.trailing).inset(19)
            make.top.equalTo(quizView.snp.top).inset(22)
            make.height.equalTo(31)
            make.width.equalTo(31)
        }
        
        quizContent.snp.makeConstraints { ( make ) in
            make.width.equalTo(quizView.snp.width).multipliedBy(0.854)
            make.height.equalTo(quizView.snp.height).multipliedBy(0.332)
            make.centerX.equalTo(quizView.snp.centerX)
            make.bottom.equalTo(quizView.snp.bottom).offset(-65)
            
        }
        timeLabel.snp.makeConstraints { ( make ) in
            make.center.equalTo(stopwatchView.snp.center)
            make.width.equalTo(25)
            make.height.equalTo(25)
        
            
        }
        
        
    }
    
}

