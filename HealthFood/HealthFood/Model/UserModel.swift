//
//  UserModel.swift
//  HealthFood
//
//  Created by Mobios on 1/27/23.
//  Copyright © 2023 Pabasara. All rights reserved.
//

import Foundation
struct UserModel: Identifiable {
    var id: String = UUID().uuidString
    var userid : Int
    var phone: String
    var name: String
    var email: String
}
