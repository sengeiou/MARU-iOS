//
//  SearchVC.swift
//  MARU
//
//  Created by 이윤진 on 2020/08/16.
//  Copyright © 2020 maru. All rights reserved.
//

import UIKit
import CoreData

class SearchVC: UIViewController{
    
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

    
//    var recodeMemory : [String] = []
//    var recodeObject: [NSManagedObject] = []
//    let con = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//    var searchText: String = ""
    
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var SearchTV: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nibName = UINib(nibName: "SearchTVCell", bundle: nil)
        SearchTV.register(nibName, forCellReuseIdentifier: "SearchTVCell")
        SearchTV.delegate = self
        SearchTV.dataSource = self
        SearchTV.separatorStyle = UITableViewCell.SeparatorStyle.none
        
//        let context = self.getRecode()
//        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Recode")
//
//        let sortDescriptor = NSSortDescriptor(key: "time", ascending: false)
//        fetchRequest.sortDescriptors = [sortDescriptor]
//
//        do{
//            recodeObject = try context.fetch(fetchRequest)
//        } catch let error as NSError {
//            print(error)
//        }
//
//        for i in 0..<recodeObject.count {
//            recodeMemory.append(recodeObject[i].value(forKey: "recode") as! String)
//        }
    }
    
    // MARK: -  지금 임의로 뷰 전환을 위해 취소버튼에다가 네비게이션 push되도록 설정하였음
    @IBAction func cancelBtnTouched(_ sender: Any) {
        guard let searchResultVC = self.storyboard?.instantiateViewController(identifier:
        "SearchResultVC") as? SearchResultVC else { return }
        self.navigationController?.pushViewController(searchResultVC, animated: true)
    }
    
    
    //MARK: - hide navigation bar
    /*override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }*/
    
}

extension SearchVC: UITableViewDelegate,UITableViewDataSource{
    
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
        
        //headerDeleteButton.addTarget(self, action: #selector(deleteAllRecords), for: .touchUpInside)
        
        return headerView
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 30
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        let postItems = recodeMemory.count
//
//        if postItems == 0 {
//            SearchTV.setEmptyView(title: "", message: "검색 기록이 없습니다.")
//        } else {
//            SearchTV.restore()
//        }
//
//        return postItems
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTVCell",for: indexPath) as! SearchTVCell
        /*let recoding = recodeMemory[indexPath.row]
        
        cell.traceLabel.text = recoding*/
        cell.traceLabel.text = "검색어 기록"
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.white
        cell.selectedBackgroundView = bgColorView
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = tableView.dequeueReusableCell(withIdentifier: "SearchTVCell",
                                          for: indexPath) as! SearchTVCell
        
        //searchText = recodeMemory[indexPath.row]
//        self.searchInList()
//        self.SearchTV.reloadData()
    }
    
}

extension SearchVC{
    
//    func set(){
//        searchTextField.becomeFirstResponder()
//        SearchTV.register(UINib(nibName: "SearchTVCell", bundle: nil),
//                          forCellReuseIdentifier: "SearchTVCell")
//        searchBtn.addTarget(self,
//                               action: #selector(search),
//                               for: .touchUpInside)
    

//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
//        self.view.endEditing(true)
//    }
//
    func getRecode() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
//    func save(_ inputRecode: String) {
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
//            return
//        }
//
//        // 1
//        let managedContext =
//            appDelegate.persistentContainer.viewContext
//
//        // 2
//        let entity =
//            NSEntityDescription.entity(forEntityName: "Recode", in: managedContext)!
//
//        let recode = NSManagedObject(entity: entity,insertInto: managedContext)
//
//        // 3
//        recode.setValue(inputRecode, forKeyPath: "recode")
//        recode.setValue(Date(), forKey: "time")
//
//        // 4
//        do {
//            try managedContext.save()
//            recodeObject.append(recode)
//        } catch let error as NSError {
//            print("Could not save. \(error), \(error.userInfo)")
//        }
//
//    }
//
//    @objc func search(){
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchResultVC") as! SearchResultVC
//
//        let text = searchTextField.text ?? ""
//        save(text)
//        vc.searchResult = text
//
//        recodeMemory.insert(text, at: 0)
//        SearchTV.reloadData()
//        searchTextField.text = ""
//
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
//
//    @objc func searchInList(){
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchResultVC") as! SearchResultVC
//        let text: String = searchText
//
//        vc.searchResult = text
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
//
//    @objc func deleteAllRecords() {
//           let delegate = UIApplication.shared.delegate as! AppDelegate
//           let context = delegate.persistentContainer.viewContext
//
//           let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Recode")
//           let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
//
//           do {
//
//               try context.execute(deleteRequest)
//               try context.save()
//
//           } catch {
//
//               print ("There was an error")
//
//           }
//
//           //recodeMemory = []
//
//           SearchTV.reloadData()
//       }
}
