//
//  MainView.swift
//  PhoneBook
//
//  Created by calmkeen on 2022/07/14.
//

import Foundation
import UIKit
import SnapKit
import Realm
import RealmSwift

class MainView: UIViewController{
    
    var info = Information()
    //var info: [Information] = []
    //var info = [Information()]
    

    var tableView: UITableView = {
        let tView = UITableView()
        return tView
    }()
    var addBtn: UIButton = {
        let add = UIButton()
        add.setTitle("add", for: .normal)
        add.setTitleColor(.gray, for: .normal)
        add.addTarget(self, action: #selector(addBtnClick), for: .touchUpInside)
        return add
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        make()
        configure()
        //tablevie 설정
        tableView.delegate = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "CustomCell")
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        realmLoad()
        print(info)
        print(info.toDictionary)
    }
    func realmLoad(){
        let realm = try! Realm()
        let task = info
        try! realm.write {
            realm.add(task.self)
        }
    }
    
    func addView(){
        self.view.addSubview(tableView)
        tableView.addSubview(addBtn)
    }
    
    @objc func addBtnClick(sender: UIButton){
        let childVC = InformationView()
        self.present(childVC, animated: true, completion: nil)
    }
    
    func make(){
        
        tableView.snp.makeConstraints{ make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        addBtn.snp.makeConstraints{ make in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    func configure(){
        tableView.dataSource = self
        tableView.rowHeight = 70
    }
    // ============ 07.19. ============
//        private func makeData() {
//            for i in 0...1 {
//                info.append(Information.init(
//                    name: Information.phoneName[i],
//                    phoneNum: info.phoneNum[i],
//                ))
//            }
//        }
}

extension MainView: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info.toDictionary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        // ============ 07.19. ============
        //cell.nameLabel.text = info[indexPath.row] as? String
        //cell.phoneNumLabel.text = info[indexPath.row] as? String
        cell.nameLabel.text = info.phoneName ?? ""
        cell.phoneNumLabel.text = info.toDictionary
        
        print("test")
        print(indexPath)
        return cell
    }
    
    
    
}
