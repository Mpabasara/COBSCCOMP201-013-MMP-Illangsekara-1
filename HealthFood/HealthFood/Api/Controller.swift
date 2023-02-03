//
//  Controller.swift
//  HealthFood
//
//  Created by Mobios on 1/18/23.
//  Copyright © 2023 Pabasara. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

struct Controller {
    
    func login(email: String, password: String, completionBlock: @escaping (_ success: Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error, let _ = AuthErrorCode(rawValue: error._code) {
                completionBlock(false)
            } else {
                completionBlock(true)
            }
        }
    }
    
    
    func registerUser(email: String, password: String,name:String,phone:String, completionBlock: @escaping (_ success: Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) {(res, error) in
            if let user = res?.user {
                let id=Int64((Date().timeIntervalSince1970 * 1000.0).rounded())
                let data    =  ["userid":id,
                                "name":name,
                                "email":email,
                                "phone":phone] as [String : Any]
                
                var db: DatabaseReference!
                db = Database.database().reference()
                db.child("users").child(user.uid).setValue(data)
                completionBlock(true)
            } else {
                completionBlock(false)
            }
        }
    }
    
    
    func getFoods(category: String,completionBlock: @escaping (_ success: [FoodModel]) -> Void) {
        
        var foodList:[FoodModel] = []
        var db: DatabaseReference!
        db = Database.database().reference()
        let uid = Auth.auth().currentUser?.uid
        
        db.child(category).queryOrderedByKey().observeSingleEvent(of: .value) { (snapshot) in
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                
                let placeDict = snap.value as! [String: Any]
                let img = placeDict["img"] as! String
                let name = placeDict["name"] as! String
                let description = placeDict["description"] as! String
                let calories = placeDict["calories"] as! Int
                let id = placeDict["id"] as! String
                
                let val = placeDict[uid ?? "id"] ?? ""
                
                foodList.append(FoodModel(id: id, img: img, name: name,calories:calories,marked:val as! String=="marked",description: description))
            }
            completionBlock(foodList)
        }
        
    }
    
    
    func getCurLoginUser(completionBlock: @escaping (_ success: UserModel,Int) -> Void){
        var db: DatabaseReference!
        db = Database.database().reference()
        guard let id = Auth.auth().currentUser?.uid else {
            completionBlock(UserModel(id: "0", userid:0,phone: "",name: "",email: ""),0)
            return
        }
        db.child("users").child(id).observeSingleEvent(of: .value, with: { (data) in
            let user = data.value as! [String: Any]
            completionBlock(UserModel(id: id, userid: user["userid"] as! Int,phone: user["phone"] as! String,name: user["name"] as! String,email: user["email"] as! String),1)
        })
        
    }
    
    
    func markAsFavourite(category: String,id:String,user:UserModel){
        print(Auth.auth().currentUser!.uid)
        Database.database().reference().child(category).child(id).child(Auth.auth().currentUser!.uid).setValue("marked")
    }
    
    func signOut(){
        try! Auth.auth().signOut();
    }
    
}
