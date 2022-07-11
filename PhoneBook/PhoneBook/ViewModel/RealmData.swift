//
//  Realm.swift
//  PhoneBook
//
//  Created by calmkeen on 2022/07/11.
//

import Foundation
import Realm
import RealmSwift
import UIKit

class RealmData {
    
    let realm = try! Realm()
    let info = Information()
    
    func createRealm(){
        // Add some tasks
        let task = info
        try! realm.write {
            realm.add(info.self)
        }
    }
        
        func onRealmOpened(){
            let tasks = realm.objects(Information.self)
            
            func updateRealm(){
                // All modifications to a realm must happen in a write block.
                let taskToUpdate = tasks[0]
                try! realm.write {
                    // tasks.index = "1"
                    
                }
            }
            
            //realm에서의 삭제
            func RealmDelete(){
                let taskToDelete = tasks[0]
                try! realm.write {
                    // Delete the LocalOnlyQsTask.
                    realm.delete(taskToDelete)
                }
            }
            func AllDelete(){
                realm.deleteAll()
            }
        }
    }

