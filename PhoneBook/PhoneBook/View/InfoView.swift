//
//  InfoView.swift
//  PhoneBook
//
//  Created by calmkeen on 2022/07/14.
//

import Foundation
import UIKit
import SnapKit
import Realm
import RealmSwift

class InformationView: UIViewController{
    
    var realm: Realm!
    let table = MainView()
    let content = Infodata()
    let info = Info()
    let contentView = ContentView()
    let infoView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    let saveBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "person.badge.plus"),for: .normal)
        btn.addTarget(self, action: #selector(saveBtnClick), for: .touchUpInside)
        return btn
    }()
    let nameField: UITextField = {
        let name = UITextField()
        name.backgroundColor = .lightGray
        name.placeholder = " 이 름 "
        return name
    }()
    let phoneNumber: UITextField = {
        let phoneNum = UITextField()
        phoneNum.placeholder = " 전화번호 "
        phoneNum.backgroundColor = .lightGray
        return phoneNum
    }()
    let tag: UITextField = {
        let tag = UITextField()
        tag.placeholder = "학교 및 직장"
        tag.backgroundColor = .lightGray
        return tag
    }()
    let userimage: UIImageView = {
        let image = UIImageView()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 140, weight: .bold, scale: .large)
        image.image = UIImage(systemName: "person.crop.circle.fill", withConfiguration: largeConfig)
        image.layer.cornerRadius = 15
        return image
    }()
    let titleLabel: UILabel = {
        let title = UILabel()
        title.text = "새로운 연락처 "
        title.textColor = .gray
        title.textAlignment = .center
        return title
    }()
    let cancelBtn: UIButton = {
        let cancel = UIButton()
        return cancel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        realm = try! Realm()
        makeView()
        make()
        //        configure()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
    }
    func makeView(){
        self.view.addSubview(infoView)
        infoView.addSubview(titleLabel)
        infoView.addSubview(userimage)
        infoView.addSubview(nameField)
        infoView.addSubview(phoneNumber)
        infoView.addSubview(tag)
        infoView.addSubview(saveBtn)
    }
    
    func make(){
        infoView.snp.makeConstraints{ make in
            make.edges.equalTo(self.view)
        }
        titleLabel.snp.makeConstraints{ make in
            make.top.equalTo(10)
            make.trailing.leading.equalTo(0)
            make.height.equalTo(40)
        }
        userimage.snp.makeConstraints{ make in
            make.top.equalTo(titleLabel.snp.bottom).offset(50)
            make.leading.trailing.equalTo(0)
            make.centerX.equalTo(0)
        }
        nameField.snp.makeConstraints{ make in
            make.top.equalTo(userimage.snp.bottom).offset(60)
            make.trailing.leading.equalTo(0)
            make.height.equalTo(40)
        }
        phoneNumber.snp.makeConstraints{ make in
            make.top.equalTo(nameField.snp.bottom).offset(2)
            make.trailing.leading.equalTo(0)
            make.height.equalTo(40)
        }
        tag.snp.makeConstraints{ make in
            make.top.equalTo(phoneNumber.snp.bottom).offset(2)
            make.trailing.leading.equalTo(0)
            make.height.equalTo(40)
        }
        saveBtn.snp.makeConstraints{ make in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(0)
            make.centerX.equalTo(0)
        }
    }
    //    func configure(){
    //
    //    }
    //    func realmLoad(){
    //            let listCount: Results<Infodata>!
    //            listCount = realm.objects(Infodata.self)
    //            let taskToUpdate = listCount[0]
    //            try! realm.write {
    //                realm.add(listCount.self, update: .all)
    //            }
    //    }
    func navInfoViewLoad(){
            let childVC = contentView
            //self.navigationController?.pushViewController(childVC, animated: true)
        self.present(childVC, animated: true){
            self.infoView.inputViewController?.dismiss(animated: true)
        }
            childVC.modalPresentationStyle = .fullScreen
    }
    @objc
    func saveBtnClick(sender: UIButton){
        content.phoneName = self.nameField.text!
        content.phoneNum = self.phoneNumber.text!
        try! realm.write {
            realm.add(content, update: .all)
        }
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        table.tableView.reloadData()
        self.presentingViewController?.dismiss(animated: true)
        self.presentedViewController?.dismiss(animated: false)
        //self.navigationController?.popViewController(animated: true)
        
//        let vc2 = ContentView()
//        let childNavigation = UINavigationController(rootViewController: vc2)
//        childNavigation.modalPresentationStyle = .fullScreen
//        childNavigation.isNavigationBarHidden = false
//        self.navigationController?.pushViewController(childNavigation, animated: true)
        
        navInfoViewLoad()

    }
}
