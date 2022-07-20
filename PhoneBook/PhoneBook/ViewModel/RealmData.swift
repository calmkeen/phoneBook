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
    //realm을 사용하려면 이런식으로 객체를 열어서 사용해야함
    let realm = try! Realm()
    //데이터를 가져올 부분
    let info = Info()
    let content = Infodata()
    
    //realm데이터 공간을 만들자
    func createRealm(){
        
        // Add some tasks (추가)
        let task = info
        try! realm.write {
            realm.add(content.self)
        }
    }
        //realm에서 객체를 얻어오는것
    //let tasks =realm.obj이부분의 경우 시퀀스 문제로 func으로 감싸지 않으면 안되더라? 아직 더 찾아봐야함
        func onRealmOpened(){
            let tasks = realm.objects(Infodata.self)
            
            //데이터 추가하면 업데이트 (불러오기)
            func updateRealm(){
                // All modifications to a realm must happen in a write block.
                let taskToUpdate = tasks[0]
                try! realm.write {
                    // tasks.index = "1"
                    
                }
            }
            
            //realm에서의 삭제(삭제)
            func RealmDelete(){
                let taskToDelete = tasks[0]
                try! realm.write {
                    // Delete the LocalOnlyQsTask.
                    realm.delete(taskToDelete)
                }
            }
            //realm내부 데이터 전체 삭제
            func AllDelete(){
                realm.deleteAll()
            }
        }
    }

