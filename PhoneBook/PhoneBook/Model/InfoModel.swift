//
//  InfoModel.swift
//  PhoneBook
//
//  Created by calmkeen on 2022/07/08.
//

import Foundation
import UIKit
import Realm
import RealmSwift


class Information: Object{
    //@Persisted private var id = UUID()
    //처음에 프라이머리 키를 uuid위로 잡으려 했는데 realm은 아래처럼 잡아햐 한다고 doc에 나와 있어서 이렇게 변경
    //@Persisted(primaryKey: true) var index: Int?
    //name과 phoneNum validationd으로 필수 체크 추가 해야함
    //@objc dynamic(primaryKey: true) var index: Int
//    @objc dynamic var name: String?
//    @objc dynamic var phoneNum: String?
//    @objc dynamic var tag: String?
    @Persisted (primaryKey: true)var phoneName: String?
    @Persisted var phoneNum: String = ""
    @Persisted var tag: String?
    
    
    convenience init(name: String){
        self.init()
        self.phoneName = name
        self.phoneNum = phoneNum
        
    }
    // ============ 07.19. ============
    //이거어떻게 쓸지 고민중
    var toDictionary: [String: Any] {
        let dic: [String: Any] = ["index": index, "name": phoneName, "PhoneNum": phoneNum, "tag":tag]
        return dic
    }
}

