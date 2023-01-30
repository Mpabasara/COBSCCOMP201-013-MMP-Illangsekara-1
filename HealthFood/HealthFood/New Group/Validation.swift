//
//  Validation.swift
//  HealthFood
//
//  Created by Mobios on 1/26/23.
//  Copyright © 2023 Pabasara. All rights reserved.
//

import Foundation
struct Validation{
    
    func validateEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    
    func validatePassword(_ password: String) -> Bool {
        if  6 >= password.trimmingCharacters(in: CharacterSet.whitespaces).count {
            return false
        }else{
            return true;
        }
    }
}
