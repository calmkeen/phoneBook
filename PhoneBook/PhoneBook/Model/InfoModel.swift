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
    
    let localRealm = try! Realm()
    
    //@Persisted private var id = UUID()
    //처음에 프라이머리 키를 uuid위로 잡으려 했는데 realm은 아래처럼 잡아햐 한다고 doc에 나와 있어서 이렇게 변경
    @Persisted(primaryKey: true) var index: Int?
    //name과 phoneNum validationd으로 필수 체크 추가 해야함
    @Persisted var name: String?
    @Persisted var phoneNum: String?
    @Persisted var tag: String?
    
    convenience init(index: Int){
        self.init()
        self.index = index
    }
    //이거어떻게 쓸지 고민중
    var toDictionary: [String: Any] {
        let dic: [String: Any] = ["index": index, "name": name, "PhoneNum": phoneNum, "tag":tag]
        return dic
    }
}

