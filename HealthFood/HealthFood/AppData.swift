//
//  AppData.swift
//  HealthFood
//
//  Created by Mobios on 1/18/23.
//  Copyright © 2023 Pabasara. All rights reserved.
//

import Foundation
class AppData: ObservableObject{
    @Published var isLoggedIn = false;
    @Published var userId : String = ""
}
