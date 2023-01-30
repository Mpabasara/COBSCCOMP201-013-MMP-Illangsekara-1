//
//  ContentView.swift
//  HealthFood
//
//  Created by Mobios on 1/18/23.
//  Copyright © 2023 Pabasara. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let controller = Controller();
    @ObservedObject var appData : AppData;
    var body: some View {MainUIView(appData: appData).onAppear(){
        self.controller.getCurLoginUser{(user,i) -> Void in
            print(user)
            print("user")
            
            if(i==1){
                self.appData.isLoggedIn = true;
                self.appData.appLoaded = true;
                self.appData.user = user;
            }else{
                self.appData.appLoaded = true;
            }
            
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(appData: AppData())
    }
}
