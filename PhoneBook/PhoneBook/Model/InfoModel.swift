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

class Info: Object {
    var info = List<Infodata>()
}
class Infodata: Object{
    @Persisted (primaryKey: true)var phoneName: String? = ""
    @Persisted var phoneNum: String?
    @Persisted var tag: String?

    convenience init(name: String){
        self.init()
        self.phoneName = phoneName
        self.phoneNum = phoneNum
    }
    // ============ 07.19. ============
    //이거어떻게 쓸지 고민중
    var toDictionary: [String: Any] {
        let dic: [String: Any] = ["index": index, "name": phoneName, "PhoneNum": phoneNum, "tag":tag]
        return dic
    }
}

