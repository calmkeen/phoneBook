//
//  InfoView.swift
//  PhoneBook
//
//  Created by calmkeen on 2022/07/14.
//

import Foundation
import UIKit
import SnapKit

class InformationView: UIViewController{
    
    let infoView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    var nameField: UITextField = {
        let name = UITextField()
        return name
    }()
    var phoneNumber: UITextField = {
        let phoneNum = UITextField()
        return phoneNum
    }()
    var tag: UITextField = {
        let tag = UITextField()
        return tag
    }()
    var Userimage: UIImage = {
        let image = UIImage()
        return image
    }()
    var titleLabel: UILabel = {
        let title = UILabel()
        title.text = "새로운 연락처"
        title.textColor = .gray
        return title
    }()
    var cancelBtn: UIButton = {
        let cancel = UIButton()
        return cancel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeView()
        make()
        configure()
        
    }
    func makeView(){
        self.view.addSubview(infoView)
        infoView.addSubview(titleLabel)
    }
    
    func make(){
        infoView.snp.makeConstraints{ make in
            make.edges.equalTo(self.view)
        }
        
        titleLabel.snp.makeConstraints{ make in
            make.center.equalTo(view)
        }
        
    }
    func configure(){
        
    }
    
}
