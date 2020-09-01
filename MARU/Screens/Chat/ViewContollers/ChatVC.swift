//
//  ChatVC.swift
//  MARU
//
//  Created by 오준현 on 2020/08/14.
//  Copyright © 2020 maru. All rights reserved.
//

import UIKit

import Then
import SnapKit
import SwiftKeychainWrapper
import RxSwift
import RxCocoa

struct Message: Codable {
    let name: String
    let message: String
    let time: Int
}

class ChatVC: UIViewController {
    
    // MARK: - UI components
    
    let chatCollectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: UICollectionViewFlowLayout()).then
        {
            $0.backgroundColor = .white
            $0.allowsMultipleSelection = true
            $0.isPrefetchingEnabled = true
            $0.isScrollEnabled = true
            
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 3
            layout.minimumInteritemSpacing = 0
            
            $0.collectionViewLayout = layout
    }
    
    let textFieldView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
        $0.layer.shadowRadius = 8.0
        $0.layer.shadowOpacity = 0.2
        $0.layer.shadowPath = UIBezierPath(roundedRect: $0.bounds, cornerRadius: $0.layer.cornerRadius).cgPath

    }
    
    let outTextFieldView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 19
        $0.borderColor = .veryLightPinkTwo
        $0.borderWidth = 1
    }

    let textField = UITextField().then {
        $0.tintColor = .black22
        $0.backgroundColor = .white
    }
    
    let sendButton = UIButton().then {
        $0.setImage(UIImage(named: "chatBtnSend"), for: .normal)
        $0.frame = .init(x: 0, y: 0, width: 30, height: 30)
    }

    let noticeView = UIView().then {
        $0.backgroundColor = .white
    }
    
    let noticeLabel = UILabel().then {
        $0.text = "토론방의 유지기간은 1주일입니다. 1주일 후 방에 입장하실 수 없습니다. 비속어 및 욕설, 상대방에 대한 인신공격은 금지합니다. 스팸, 광고성 홍보글은 금지합니다. 토론방의 목적에 맞게 토론합니다. "
        $0.numberOfLines = 0
        $0.font = UIFont.systemFont(ofSize: 10, weight: .regular)
    }
    
    let noticeDeleteButton = UIButton().then {
        $0.setImage(UIImage(named: "grayDelete"), for: .normal)
        $0.addTarget(self, action: #selector(didTapDeleteButton), for: .touchUpInside)
    }
    
    let popupView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 8
    }
    
    let blurImageView = UIImageView().then {
        $0.image = UIImage(named: "backScrim")
    }
        
    let ratingGuideLabel = UILabel().then {
        $0.text = "토론은 어떠셨나요?"
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
    }
    
    let firstRatingButton = UIButton().then {
        $0.setImage(UIImage(named: "starGray"), for: .normal)
        $0.addTarget(self, action: #selector(didTapFirst), for: .touchUpInside)
    }
    
    let secondRatingButton = UIButton().then {
        $0.setImage(UIImage(named: "starGray"), for: .normal)
        $0.addTarget(self, action: #selector(didTapSecond), for: .touchUpInside)
    }
    
    let thirdRatingButton = UIButton().then {
        $0.setImage(UIImage(named: "starGray"), for: .normal)
        $0.addTarget(self, action: #selector(didTapThird), for: .touchUpInside)
    }
    
    let fourthRatingButton = UIButton().then {
        $0.setImage(UIImage(named: "starGray"), for: .normal)
        $0.addTarget(self, action: #selector(didTapFourth), for: .touchUpInside)
    }
    
    let fifthRatingButton = UIButton().then {
        $0.setImage(UIImage(named: "starGray"), for: .normal)
        $0.addTarget(self, action: #selector(didTapFifth), for: .touchUpInside)
    }

    let ratingNameLabel = UILabel().then {
        $0.text = "님의 별점을 평가해주세요."
        $0.font = .systemFont(ofSize: 15, weight: .light)
    }
    
    let ratingEndButton = UIButton().then {
        $0.setTitle("확인", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        $0.backgroundColor = .veryLightPink
        $0.isEnabled = false
    }
    
    // MARK: - Variables and Properties
    
    let id = "오준현"
    var rating = 0
    
    // MARK: - Dummy Data
    
    var chatDummy: [Message] = []
    var chat: [Message] = []
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        constraint()
        constraintNotice()
        collectionView()
        KeychainWrapper.standard.set("오준현", forKey: "id")

        setNavigation()
//        setPopUpView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchChatData()
        addKeyboardNotification()
        self.chatCollectionView.reloadData()
        scrollToBottom()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?){
        self.view.endEditing(true)
    }
}

// MARK: - Helper

extension ChatVC {
    
    func setNavigation(){
        let bar = navigationController?.navigationBar
        bar?.setBackgroundImage(UIImage(), for: .default)
        bar?.shadowImage = UIImage()
        bar?.isTranslucent = true
        bar?.topItem?.title = "외로운도시"
        bar?.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15,
                                                                                   weight: .medium)]

    }
    
    func scrollToBottom() {
        DispatchQueue.main.async {
            let lastItem = self.chatDummy.count - 1
            let indexPath = IndexPath(row: lastItem,
                                      section: 0)
            self.chatCollectionView.scrollToItem(at: indexPath,
                                                 at: .bottom,
                                                 animated: false)
        }
    }
    
    func scrollToBottomAnimate() {
        DispatchQueue.main.async {
            let lastItem = self.chatDummy.count - 1
            let indexPath = IndexPath(row: lastItem, section: 0)
            self.chatCollectionView.scrollToItem(at: indexPath,
                                                 at: .bottom,
                                                 animated: true)
        }
    }
    
    func constraint() {
        view.addSubview(textFieldView)
        view.addSubview(outTextFieldView)
        view.addSubview(textField)
        view.addSubview(sendButton)
        view.addSubview(chatCollectionView)
        view.addSubview(noticeView)
        view.addSubview(noticeLabel)
        view.addSubview(noticeDeleteButton)
        
        textFieldView.snp.makeConstraints { (make) in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(46)
        }
        
        outTextFieldView.snp.makeConstraints { (make) in
            make.leading.equalTo(textFieldView.snp.leading).offset(10)
            make.trailing.equalTo(textFieldView.snp.trailing).offset(-10)
            make.bottom.equalTo(textFieldView.snp.bottom).inset(4)
            make.top.equalTo(textFieldView.snp.top).offset(4)
        }

        textField.snp.makeConstraints { (make) in
            make.leading.equalTo(outTextFieldView.snp.leading).offset(10)
            make.trailing.equalTo(sendButton.snp.leading).offset(-5)
            make.bottom.equalTo(outTextFieldView.snp.bottom).inset(3)
            make.top.equalTo(outTextFieldView.snp.top).offset(3)
        }
        
        sendButton.snp.makeConstraints { (make) in
            make.trailing.equalTo(outTextFieldView.snp.trailing).inset(5)
            make.top.equalTo(outTextFieldView.snp.top).offset(5)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
        chatCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(textFieldView.snp.top)
        }
        
        
    }
    
    func constraintNotice(){
        noticeView.snp.makeConstraints { (make) in
            make.top.equalTo(chatCollectionView.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(60)
        }
        
        noticeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(chatCollectionView.snp.top).offset(12)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-32)
            make.height.equalTo(36)
        }
        
        noticeDeleteButton.snp.makeConstraints { (make) in
            make.top.equalTo(chatCollectionView.snp.top).offset(9)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(10)
            make.width.equalTo(10)
        }

    }
    
    func collectionView() {
        chatCollectionView.delegate = self
        chatCollectionView.dataSource = self
        chatCollectionView.prefetchDataSource = self
        chatCollectionView.register(ChatCVCell.self,
                                    forCellWithReuseIdentifier: Identifier.Chat)
        chatCollectionView.register(MyChatCVCell.self,
                                    forCellWithReuseIdentifier: Identifier.MyChat)
        
    }
    
    func delegate() {
        textField.delegate = self
    }
    
    @objc func didTapDeleteButton() {
        UserDefaults.standard.set(id, forKey: "deleteid")
        noticeView.isHidden = true
        noticeLabel.isHidden = true
        noticeDeleteButton.isHidden = true
        
    }
    
    private func fetchChatData() {
        
        let spinner = Spinner.init()
        spinner.show()
        
        if let url = Bundle.main.url(forResource: "chat", withExtension: "json") {
            DispatchQueue.main.async {
                spinner.hide()
            }
            do {
                let data = try Data.init(contentsOf: url)
                let decoder = JSONDecoder.init()
                self.chatDummy = try decoder.decode([Message].self, from: data)
                self.chat = try decoder.decode([Message].self, from: data)
                
                for index in 0 ..< chatDummy.count - 1 {
                    if chatDummy[index].name == id {
                        
                    } else if chatDummy[index].name == chatDummy[index + 1].name {
                        chat[index + 1] = Message(name: "",
                                                  message: chatDummy[index+1].message,
                                                  time: chatDummy[index+1].time)
                    }
                }
                
                self.chatCollectionView.reloadData()
                
            } catch let err {
                print(err.localizedDescription)
            }
            
        }
    }
    
    @objc func didTapFirst(){
        rating = 1
        firstRatingButton.setImage(UIImage(named: "starBlue"), for: .normal)
        secondRatingButton.setImage(UIImage(named: "starGray"), for: .normal)
        thirdRatingButton.setImage(UIImage(named: "starGray"), for: .normal)
        fourthRatingButton.setImage(UIImage(named: "starGray"), for: .normal)
        fifthRatingButton.setImage(UIImage(named: "starGray"), for: .normal)
        ratingEndButton.isEnabled = true
        ratingEndButton.backgroundColor = .cornflowerBlue
    }
    @objc func didTapSecond(){
        rating = 2
        firstRatingButton.setImage(UIImage(named: "starBlue"), for: .normal)
        secondRatingButton.setImage(UIImage(named: "starBlue"), for: .normal)
        thirdRatingButton.setImage(UIImage(named: "starGray"), for: .normal)
        fourthRatingButton.setImage(UIImage(named: "starGray"), for: .normal)
        fifthRatingButton.setImage(UIImage(named: "starGray"), for: .normal)
        ratingEndButton.isEnabled = true
        ratingEndButton.backgroundColor = .cornflowerBlue
    }
    @objc func didTapThird(){
        rating = 3
        firstRatingButton.setImage(UIImage(named: "starBlue"), for: .normal)
        secondRatingButton.setImage(UIImage(named: "starBlue"), for: .normal)
        thirdRatingButton.setImage(UIImage(named: "starBlue"), for: .normal)
        fourthRatingButton.setImage(UIImage(named: "starGray"), for: .normal)
        fifthRatingButton.setImage(UIImage(named: "starGray"), for: .normal)
        ratingEndButton.isEnabled = true
        ratingEndButton.backgroundColor = .cornflowerBlue
    }
    @objc func didTapFourth(){
        rating = 4
        firstRatingButton.setImage(UIImage(named: "starBlue"), for: .normal)
        secondRatingButton.setImage(UIImage(named: "starBlue"), for: .normal)
        thirdRatingButton.setImage(UIImage(named: "starBlue"), for: .normal)
        fourthRatingButton.setImage(UIImage(named: "starBlue"), for: .normal)
        fifthRatingButton.setImage(UIImage(named: "starGray"), for: .normal)
        ratingEndButton.isEnabled = true
        ratingEndButton.backgroundColor = .cornflowerBlue
    }
    @objc func didTapFifth(){
        rating = 5
        firstRatingButton.setImage(UIImage(named: "starBlue"), for: .normal)
        secondRatingButton.setImage(UIImage(named: "starBlue"), for: .normal)
        thirdRatingButton.setImage(UIImage(named: "starBlue"), for: .normal)
        fourthRatingButton.setImage(UIImage(named: "starBlue"), for: .normal)
        fifthRatingButton.setImage(UIImage(named: "starBlue"), for: .normal)
        ratingEndButton.isEnabled = true
        ratingEndButton.backgroundColor = .cornflowerBlue
    }


    func setPopUpView(){
        blurImageView.bounds = .init(x: 0,
                                     y: 0,
                                     width: view.bounds.width,
                                     height: view.bounds.height)
        
        popupView.bounds = CGRect(x: 0,
                                  y: 0,
                                  width: self.view.bounds.width*0.8,
                                  height: 247)
        
        ratingEndButton.frame = .init(x: 0,
                                      y: 0,
                                      width: popupView.bounds.width,
                                      height: 54)
        
        ratingEndButton.roundedBottom()

        popupView.addSubview(ratingGuideLabel)
        popupView.addSubview(firstRatingButton)
        popupView.addSubview(secondRatingButton)
        popupView.addSubview(thirdRatingButton)
        popupView.addSubview(fourthRatingButton)
        popupView.addSubview(fifthRatingButton)
        popupView.addSubview(ratingNameLabel)
        popupView.addSubview(ratingEndButton)
        
        ratingGuideLabel.snp.makeConstraints { (make) in
            make.top.equalTo(popupView.snp.top).offset(35)
            make.centerX.equalTo(popupView.snp.centerX)
        }
        
        firstRatingButton.snp.makeConstraints { (make) in
            make.top.equalTo(thirdRatingButton.snp.top)
            make.trailing.equalTo(thirdRatingButton.snp.leading).offset(-46)
            make.width.equalTo(26)
            make.height.equalTo(26)
        }
        
        secondRatingButton.snp.makeConstraints { (make) in
            make.top.equalTo(thirdRatingButton.snp.top)
            make.trailing.equalTo(thirdRatingButton.snp.leading).offset(-10)
            make.width.equalTo(26)
            make.height.equalTo(26)
        }
        
        thirdRatingButton.snp.makeConstraints { (make) in
            make.top.equalTo(popupView.snp.top).offset(87)
            make.centerX.equalTo(popupView.snp.centerX)
            make.width.equalTo(26)
            make.height.equalTo(26)
        }
        
        fourthRatingButton.snp.makeConstraints { (make) in
            make.top.equalTo(thirdRatingButton.snp.top)
            make.leading.equalTo(thirdRatingButton.snp.trailing).offset(10)
            make.width.equalTo(26)
            make.height.equalTo(26)
        }
        
        fifthRatingButton.snp.makeConstraints { (make) in
            make.top.equalTo(thirdRatingButton.snp.top)
            make.leading.equalTo(thirdRatingButton.snp.trailing).offset(46)
            make.width.equalTo(26)
            make.height.equalTo(26)
        }
        
        ratingNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(popupView.snp.top).offset(142)
            make.centerX.equalTo(popupView.snp.centerX)
        }
        
        ratingEndButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(popupView.snp.bottom)
            make.centerX.equalTo(popupView.snp.centerX)
            make.width.equalTo(popupView.snp.width)
            make.height.equalTo(54)
        }
        
        let name = "라노벨 정균"
        let nameString = name + (ratingNameLabel.text ?? "")
        let attrString = NSMutableAttributedString(string: nameString)
        attrString.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String),
                                value: UIFont.systemFont(ofSize: 15, weight: .semibold) as Any,
                                range: NSMakeRange(0, name.count))
        ratingNameLabel.attributedText = attrString

        animateScaleIn(desiredView: blurImageView)
        animateScaleIn(desiredView: popupView)
        disable(false)
    }
    
    func disable(_ bool: Bool){
        chatCollectionView.isScrollEnabled = bool
        noticeDeleteButton.isEnabled = bool
        textField.isEnabled = bool
    }
    
    func animateScaleIn(desiredView: UIView) {
        let backgroundView = self.view!
        backgroundView.addSubview(desiredView)
        desiredView.center = backgroundView.center
        desiredView.isHidden = false
        
        desiredView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        desiredView.alpha = 0
        
        UIView.animate(withDuration: 0.2) {
            desiredView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            desiredView.alpha = 1
        }
    }
    
    func animateScaleOut(desiredView: UIView) {
        UIView.animate(withDuration: 0.2, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            desiredView.alpha = 0
        }, completion: { (success: Bool) in
            desiredView.removeFromSuperview()
        })
        
        UIView.animate(withDuration: 0.2, animations: {
            
        }, completion: { _ in
            
        })
    }
}

extension ChatVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let chatting = chatDummy[indexPath.item]
        let size = CGSize(width: 250, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        var estimatedFrame = NSString(string: chatting.message)
            .boundingRect(with: size,
                          options: options,
                          attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)],
                          context: nil)
        
        if chatDummy[indexPath.row].name == id || chat[indexPath.row].name == "" {
            estimatedFrame.size.height += 3
        } else {
            estimatedFrame.size.height += 22
        }
        
        return CGSize(width: view.frame.width, height: estimatedFrame.height + 20)
        
    }
    
}

extension ChatVC: UICollectionViewDelegate { }
extension ChatVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return chatDummy.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if chatDummy[indexPath.row].name == id {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.MyChat,
                                                          for: indexPath) as! MyChatCVCell
            cell.message = chat[indexPath.row]
            cell.setConstraint()
            cell.setMyChat()
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.Chat,
                                                          for: indexPath) as! ChatCVCell
            cell.message = chat[indexPath.row]
            cell.setConstraint()
            cell.setOtherChat()
            
            return cell
        }
    }
    
    
}

extension ChatVC: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        
    }
    
    
}

// MARK: - Keyboard
extension ChatVC {
    func addKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification)  {
        if let info = notification.userInfo {
            let duration = info[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
            let curve = info[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
            let keyboardFrame = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            let keyboardHeight = keyboardFrame.height
            let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first
            let bottomPadding = keyWindow?.safeAreaInsets.bottom ?? 0
            
            textFieldView.snp.updateConstraints{
                $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
                    .inset(keyboardHeight - bottomPadding)
            }
            
            chatCollectionView.snp.updateConstraints{
                $0.bottom.equalTo(textFieldView.snp.top)
            }
            
            
            self.view.setNeedsLayout()
            UIView.animate(withDuration: duration,
                           delay: 0,
                           options: .init(rawValue: curve),
                           animations: {
                            self.view.layoutIfNeeded()
            })
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        if let info = notification.userInfo {
            let duration = info[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
            let curve = info[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
            
            textFieldView.snp.updateConstraints {
                $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            }
            
            chatCollectionView.snp.updateConstraints{
                $0.bottom.equalTo(textFieldView.snp.top)
            }
            
            
            self.view.setNeedsLayout()
            UIView.animate(withDuration: duration,
                           delay: 0,
                           options: .init(rawValue: curve),
                           animations: {
                            self.view.layoutIfNeeded()
            })
        }
    }
    
}

extension ChatVC: UITextFieldDelegate {
    
}
