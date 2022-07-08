//
//  addInfoViewModel.swift
//  PhoneBook
//
//  Created by calmkeen on 2022/07/08.
//

import Foundation
import UIKit
import Realm
import RealmSwift

//-
//- 전화번호
//- 태그 (직접 태그 추가 가능하고, 직장 학교 이런거)
//
//전화번호 추가 (이름, 전화번호 필수, 태그는 선택사항)

class addInfoViewModel: UIViewController{
    //realm을열기위한 기본 코드
    let localRealm = try! Realm()
    
    //저장버튼
    func saveBtn(){
        
    }
    //취소버튼
    func cancelBtn(){
        
    }
 
    //validation 기능
    //필수 체크
    func needValid(){
        
    }
    
    
}
    extension addInfoViewModel{
        //업데이트 처리
        func updateRealm(){
            // All modifications to a realm must happen in a write block.
            let taskToUpdate = tasks[0]
            try! localRealm.write {
                taskToUpdate.status = "InProgress"
            }
        }

            //realm에서의 삭제
            func RealmDelete(){
                let taskToDelete = tasks[0]
                try! localRealm.write {
                    // Delete the LocalOnlyQsTask.
                    localRealm.delete(taskToDelete)
            }
        }
        
        //realm 데이터 베이스 만들기
        func createRealm(){
            // Add some tasks
            let task = LocalOnlyQsTask(name: "Do laundry")
            try! localRealm.write {
                localRealm.add(task)
            }
        }
    }
