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
    
    var content = Infodata()
    var listCount: Results<Infodata>!
    let realm = try! Realm()
    let info = Info()
    let tableView: UITableView = {
        let tView = UITableView()
        return tView
    }()
    let addBtn: UIButton = {
        let add = UIButton()
        add.setTitle("add", for: .normal)
        add.setTitleColor(.gray, for: .normal)
        add.addTarget(self, action: #selector(addBtnClick), for: .touchUpInside)
        return add
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listCount = realm.objects(Infodata.self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        make()
        configure()
        //tablevie 설정
        tableView.delegate = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "CustomCell")
        //realm값의 db주소를 받아오는 출력문
        print(Realm.Configuration.defaultConfiguration.fileURL!)
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
    func addView(){
        self.view.addSubview(tableView)
        tableView.addSubview(addBtn)
    }
    func configure(){
        tableView.dataSource = self
        tableView.rowHeight = 70
    }

    @objc func addBtnClick(sender: UIButton){
        let childVC = InformationView()
        self.present(childVC, animated: true, completion: nil)
    }
    
    //    func realmLoad(){
    //        let task = info
    //        try! realm.write {
    //            realm.add(task.self)
    //        }
    //    }
}

extension MainView: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCount.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        // ============ 07.19. ============
        //cell.nameLabel.text = info[indexPath.row] as? String
        //cell.phoneNumLabel.text = info[indexPath.row] as? String
        
        let row = listCount[indexPath.row]
                cell.nameLabel.text = row.phoneName
                cell.phoneNumLabel.text = row.phoneNum
//         ============ 07.20 ============
//        cell.nameLabel.text = content.phoneName ?? ""
//        cell.phoneNumLabel.text = content.phoneName ?? ""
        info.info.append(content)
        print(indexPath)
        return cell
    }
    
    
    
}
