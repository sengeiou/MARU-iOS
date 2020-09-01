//
//  RecentVC.swift
//  MARU
//
//  Created by 이윤진 on 2020/08/24.
//  Copyright © 2020 maru. All rights reserved.
//

import UIKit
import CoreData

class RecentVC: UIViewController{
    let headerView = UIView()
    let headerLabel = UIButton().then{
        $0.setTitle("최근 검색어", for: .normal)
        $0.setTitleColor(UIColor(red: 65, green: 105, blue: 225), for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
    }
    let headerDeleteButton = UIButton().then {
        $0.setTitle("전체 삭제", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 11, weight: .bold)
    }
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var RecentTV: UITableView!
    
    var recodeMemory : [String] = []
    var recodeObject: [NSManagedObject] = []
    let con = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var searchText: String = ""
    
    
    
    override func viewDidLoad() {
        let nibName = UINib(nibName: "RecentTVCell", bundle: nil)
        RecentTV.register(nibName, forCellReuseIdentifier: "RecentTVCell")
        RecentTV.delegate = self
        RecentTV.dataSource = self
        searchTextField.delegate = self
        super.viewDidLoad()
        
        let context = self.getRecode()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Recode")
        
        let sortDescriptor = NSSortDescriptor(key: "time", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        do{
            recodeObject = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print(error)
        }
        
        for i in 0..<recodeObject.count {
            recodeMemory.append(recodeObject[i].value(forKey: "recode") as! String)
        }
        func viewWillAppear(_ animated: Bool){
            self.RecentTV.separatorStyle = UITableViewCell.SeparatorStyle.none // 테이블뷰 셀 구분선 없애기
        }
        func viewDidAppear(_ animated: Bool){
            self.RecentTV.separatorStyle = UITableViewCell.SeparatorStyle.none // 테이블뷰 셀 구분선 없애기
        }
        func viewWillDisappear(_ animated: Bool){
            self.RecentTV.separatorStyle = UITableViewCell.SeparatorStyle.none
        }
        func viewDidDisappear(_ animated: Bool){
            self.RecentTV.separatorStyle = UITableViewCell.SeparatorStyle.none
        }
        set()
    }
    //    @IBAction func cancelBtnTouched(_ sender: Any) {
    //        guard let ResultVC = self.storyboard?.instantiateViewController(identifier:
    //               "ResultVC") as? ResultVC else { return }
    //               self.navigationController?.pushViewController(ResultVC, animated: true)
    //
    //    }
}

extension RecentVC: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        self.headerView.addSubview(headerDeleteButton)
        self.headerView.addSubview(headerLabel)
        
        headerDeleteButton.snp.makeConstraints { (make) in
            make.trailing.equalTo(headerView.snp.trailing)
            make.top.equalTo(headerView.snp.top).offset(5)
        }
        
        headerLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(headerView.snp.leading)
            make.top.equalTo(headerView.snp.top).offset(5)
        }
        
        headerDeleteButton.addTarget(self, action: #selector(deleteAllRecords), for: .touchUpInside)
        
        return headerView
    }
    
    @objc func deleteAllRecords(){
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Recode")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        
        do {
            
                  try context.execute(deleteRequest)
                  try context.save()
              
              } catch {
              
                  print ("There was an error")
              
              }
              
              recodeMemory = []
              
              RecentTV.reloadData()
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 30
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let postItems = recodeMemory.count
                      
              if postItems == 0 {
                  RecentTV.setEmptyView(title: "", message: "검색 기록이 없습니다.")
              } else {
                  RecentTV.restore()
              }

              return postItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecentTVCell",for: indexPath) as! RecentTVCell
        let recoding = recodeMemory[indexPath.row]
        
        cell.recentSearchLabel.text = recoding
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.white
        cell.selectedBackgroundView = bgColorView
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         _ = tableView.dequeueReusableCell(withIdentifier: "RecentTVCell",
                                                 for: indexPath) as! RecentTVCell

               searchText = recodeMemory[indexPath.row]
               self.searchInList()
               self.RecentTV.reloadData()
    }
    
}

extension RecentVC {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    func set(){
        searchBtn.isHidden = true
        RecentTV.separatorStyle = .none // 테이블뷰 셀 구분선 없애기
        RecentTV.tableFooterView = nil
        searchTextField.becomeFirstResponder()
        searchBtn.addTarget(self,
        action: #selector(search),
        for: .touchUpInside)
    }
    func getRecode() -> NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func save(_ inputRecode: String){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        // 1
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        // 2
        let entity =
            NSEntityDescription.entity(forEntityName: "Recode",
                                       in: managedContext)!
        
        let recode = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        
        // 3
        recode.setValue(inputRecode, forKeyPath: "recode")
        recode.setValue(Date(), forKey: "time")
        
        // 4
        do {
            try managedContext.save()
            recodeObject.append(recode)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    @objc func search(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResultVC") as! ResultVC
        
        let text = searchTextField.text ?? ""
        save(text)
        vc.searchResult = text
        
        recodeMemory.insert(text, at: 0)
        RecentTV.reloadData()
        
        searchTextField.text = ""
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func searchInList(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResultVC") as! ResultVC
        let text: String = searchText
        vc.searchResult = text
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension RecentVC: UITextFieldDelegate{
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
           // 입력된 빈칸 감지하기
           var str = textField.text
           str = str?.replacingOccurrences(of: " ", with: "")
           
           if str?.count == 0 {
               searchBtn.isHidden = true
           } else {
               searchBtn.isHidden = false
           }
       }
       
       func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           // 입력된 빈칸 감지하기
           var str = textField.text
           str = str?.replacingOccurrences(of: " ", with: "")
           
           if str?.count != 0 {
               search()
               searchTextField.resignFirstResponder()
           }
           return true
       }
}
