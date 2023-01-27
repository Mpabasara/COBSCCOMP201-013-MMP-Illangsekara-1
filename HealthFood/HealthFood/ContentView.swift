//
//  ContentView.swift
//  HealthFood
//
//  Created by Mobios on 1/18/23.
//  Copyright © 2023 Pabasara. All rights reserved.
//

import SwiftUI

struct ContentView: View {
     @ObservedObject var appData : AppData;
    var body: some View {
        MainUIView(appData: appData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(appData: AppData())
    }
}
