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
    let info = Information()
    
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
    var nameField: UITextField = {
        let name = UITextField()
        name.backgroundColor = .lightGray
        name.placeholder = " 이 름 "
        return name
    }()
    var phoneNumber: UITextField = {
        let phoneNum = UITextField()
        phoneNum.placeholder = " 전화번호 "
        phoneNum.backgroundColor = .lightGray
        return phoneNum
    }()
    var tag: UITextField = {
        let tag = UITextField()
        tag.placeholder = "학교 및 직장"
        tag.backgroundColor = .lightGray
        return tag
    }()
    var userimage: UIImageView = {
        let image = UIImageView()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 140, weight: .bold, scale: .large)
        image.image = UIImage(systemName: "person.crop.circle.fill", withConfiguration: largeConfig)
        image.layer.cornerRadius = 15
        return image
    }()
    var titleLabel: UILabel = {
        let title = UILabel()
        title.text = "새로운 연락처 "
        title.textColor = .gray
        title.textAlignment = .center
        return title
    }()
    var cancelBtn: UIButton = {
        let cancel = UIButton()
        return cancel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //realm = try! Realm()
        makeView()
        make()
        configure()
        
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
    func configure(){
        
    }
    @objc func saveBtnClick(sender: UIButton){
        info.name = self.nameField.text!
        info.phoneNum = self.phoneNumber.text!
        let realm = try! Realm()
        try! realm.write {
            realm.add(info)
        }
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        let list = realm.objects(Information.self)
        print(list)
        //let childVC = MainView()
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}

