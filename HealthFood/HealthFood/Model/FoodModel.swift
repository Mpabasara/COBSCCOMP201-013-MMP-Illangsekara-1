//
//  FoodModel.swift
//  HealthFood
//
//  Created by Mobios on 1/27/23.
//  Copyright © 2023 Pabasara. All rights reserved.
//

import Foundation
struct FoodModel:Identifiable {
    var id: String =  UUID().uuidString
    var img: String
    var name: String
    var calories:Int
    var marked: Bool
    var description :String;
}
