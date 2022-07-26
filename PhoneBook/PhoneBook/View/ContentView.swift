//
//  ContextView.swift
//  PhoneBook
//
//  Created by calmkeen on 2022/07/21.
//

import Foundation
import UIKit
import SwiftUI
import SnapKit
import RealmSwift

class ContentView: UINavigationController
{
    
    let NaviContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    let contentName: UILabel = {
        let name = UILabel()
        name.backgroundColor = .lightGray
        name.text = "abc"
        return name
    }()
    let contentPN: UILabel = {
        let phoneNum = UILabel()
        phoneNum.backgroundColor = .lightGray
        phoneNum.text = "bc"
        return phoneNum
    }()
    let contentTag: UILabel = {
        let tag = UILabel()
        tag.backgroundColor = .lightGray
        tag.text = "abcddd"
        return tag
    }()
    let userImage: UIImageView = {
        let image = UIImageView()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 140, weight: .bold, scale: .large)
        image.image = UIImage(systemName: "person.crop.circle.fill", withConfiguration: largeConfig)
        image.layer.cornerRadius = 15
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeView()
        makeLayout()
//        configure()
    }
    func makeView(){
        self.view.addSubview(NaviContentView)
        NaviContentView.addSubview(contentName)
        NaviContentView.addSubview(contentPN)
        NaviContentView.addSubview(contentTag)
        NaviContentView.addSubview(userImage)
    }
    func makeLayout(){
        NaviContentView.snp.makeConstraints{ make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        userImage.snp.makeConstraints{ make in
            make.top.equalTo(0).offset(50)
            make.leading.trailing.equalTo(0)
            make.centerX.equalTo(0)
        }
        contentName.snp.makeConstraints{ make in
            make.top.equalTo(userImage.snp.bottom).offset(60)
            make.trailing.leading.equalTo(0)
            make.height.equalTo(40)
        }
        contentPN.snp.makeConstraints{ make in
            make.top.equalTo(contentName.snp.bottom).offset(2)
            make.trailing.leading.equalTo(0)
            make.height.equalTo(40)
        }
        contentTag.snp.makeConstraints{ make in
            make.top.equalTo(contentPN.snp.bottom).offset(2)
            make.trailing.leading.equalTo(0)
            make.height.equalTo(40)
        }
    }
}


