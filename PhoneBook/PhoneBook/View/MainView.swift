//
//  MainView.swift
//  PhoneBook
//
//  Created by calmkeen on 2022/07/14.
//

import Foundation
import UIKit
import SnapKit

class MainView: UIViewController{
   
    var tableView: UITableView = {
        let tView = UITableView()
        return tView
    }()
    var addBtn: UIButton = {
        let add = UIButton()
        add.setTitle("add", for: .normal)
        add.setTitleColor(.gray, for: .normal)
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
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "CustomCell")

        


    }
    
    
    func addView(){
        self.view.addSubview(tableView)
        tableView.addSubview(addBtn)
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
        
    }
}

extension MainView: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? TableViewCell else { return UITableViewCell() }

                

                return cell
    }
}
