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
}

