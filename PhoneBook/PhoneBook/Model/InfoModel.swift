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
    
    @Persisted private var id = UUID()
    @Persisted(primaryKey: true) var index: Int?
    
    @Persisted var name: String?
    @Persisted var phoneNum: String?
    @Persisted var tag: String?
    
    convenience init(index: Int){
        self.init()
        self.index = index
    }
    var toDictionary: [String: Any] {
        let dic: [String: Any] = ["index": index, "name": name, "PhoneNum": phoneNum, "tag":tag]
        return dic
    }
}

