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
import SocketIO

struct Message: Codable {
    let name: String
    let message: String
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
        $0.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    let sendButton = UIButton().then {
        $0.setImage(UIImage(named: "chatBtnSend"), for: .normal)
        $0.frame = .init(x: 0, y: 0, width: 30, height: 30)
        $0.addTarget(self, action: #selector(didTapSendButton), for: .touchUpInside)
        $0.isHidden = true
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
    
    let id = KeychainWrapper.standard.string(forKey: Keychain.name.rawValue)
    var rating = 0
    var roomIndex: Int?
    var time = 18
    // MARK: - Dummy Data
    
    var chatDummy: [Message] = []
    var chat: [Message] = []
    var message: String?
    var name: String?
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        constraint()
        
        if UserDefaults.standard.string(forKey: "deleteid") == "" {
            constraintNotice()
        }
        
        collectionView()
        
        setNavigation()
        
        //        setPopUpView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchChatData()
        addKeyboardNotification()
        self.chatCollectionView.reloadData()
        scrollToBottom()
        SocketIOManager.shared.establishConnection(id ?? "")
        SocketIOManager.shared.connect { (res) in
            self.name = (res[0] as? String)
            self.message = (res[1] as? String)
            self.chatCollectionView.reloadData()
            //            self.scrollToBottom()
        }
        
        navigationController?.navigationBar.isHidden = false
        tabBarController?.tabBar.isHidden = true
        
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)

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
        
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.setBackgroundImage(UIImage(),
                                                               for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isHidden = false
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
    
    
    func collectionView() {
        chatCollectionView.delegate = self
        chatCollectionView.dataSource = self
        chatCollectionView.prefetchDataSource = self
        chatCollectionView.register(ChatCVCell.self,
                                    forCellWithReuseIdentifier: Identifier.Chat)
        chatCollectionView.register(MyChatCVCell.self,
                                    forCellWithReuseIdentifier: Identifier.MyChat)
        let view = UIView()
        view.backgroundColor = nil
        chatCollectionView.backgroundView = view
        view.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                          action: #selector(handleTap)))
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
                                                  message: chatDummy[index+1].message)
                    }
                }
                
                self.chatCollectionView.reloadData()
                
            } catch let err {
                print(err.localizedDescription)
            }
            
        }
    }
    
    
    @objc func didTapSendButton() {
        SocketIOManager.shared.sendMessage(roomIndex ?? 1, textField.text ?? "", id ?? "")
        chat.append(Message.init(name: id ?? "", message: textField.text ?? ""))
        chatDummy.append(Message.init(name: id ?? "", message: textField.text ?? ""))
        time += 1
        textField.text = ""
        sendButton.isHidden = true
        chatCollectionView.reloadData()
        //        scrollToBottom()
    }
    
}

extension ChatVC {
    
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
        if (name == id) || name == "" || name == nil {
        } else {
            chat.append(Message.init(name: name ?? "",
                                     message: message ?? ""))
            chatDummy.append(Message.init(name: name ?? "",
                                          message: message ?? ""))
        }
        
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
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        print(#function)
    }
}

extension ChatVC: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView,
                        prefetchItemsAt indexPaths: [IndexPath]) {
        
    }
    
    
}

// MARK: - Keyboard
extension ChatVC {
    func addKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
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
    @objc func textFieldDidChange(_ textField: UITextField){
        textField.text == "" ? (sendButton.isHidden = true) : (sendButton.isHidden = false)
    }
}
