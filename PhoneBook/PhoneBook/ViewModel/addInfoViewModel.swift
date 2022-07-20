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
    
    let info = Info()
    let realmCRUD = RealmData()
    var realm: Realm!
    
    //realm을열기위한 기본 코드
    
   //메모리 관리
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //뷰 불러오기
    override func viewDidLoad() {
        super.viewDidLoad()
        //realm = try! Realm()
        realmCRUD.onRealmOpened()
    }
    
    //저장버튼
    func saveBtn(){
        //updateRealm()
    }
    
    //취소버튼
    func cancelBtn(){
        //RealmDelete()
    }
     
}
    extension addInfoViewModel{
        
    }
