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
    @Persisted var index = Int()
    
    @Persisted var name: String
    @Persisted var phoneNum: String
    @Persisted var tag: String
    
    var toDictionary: [String: Any] {
        let dic: [String: Any] = ["index": index, "name": name, "PhoneNum": phoneNum, "tag":tag]
        return dic
    }
}

