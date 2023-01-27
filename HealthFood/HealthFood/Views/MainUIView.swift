//
//  MainUIView.swift
//  HealthFood
//
//  Created by Mobios on 1/18/23.
//  Copyright © 2023 Pabasara. All rights reserved.
//

import SwiftUI

struct MainUIView: View {
    @ObservedObject var appData : AppData;
    @State var mainView = false;
    var body: some View {
        
        NavigationView {
                  ZStack{
                     ScrollView(.vertical){
                     LoginUIView(appData: appData);
            
                    }.navigationBarTitle("Home", displayMode: .inline)
                        .navigationBarItems(leading:
                            HStack {
                                if(appData.isLoggedIn){
                                    NavigationLink(
                                        destination: FavouriteUIView(),
                                        label: {
                                            Image(systemName: "star").imageScale(.large).foregroundColor(Color("colorIcon"))
                                    })
                                }
                            }
                            , trailing:
                            HStack {
                                if(appData.isLoggedIn){
                                    NavigationLink(
                                        destination: MyProfileUIView(),
                                        isActive: $mainView,
                                        label: {
                                            Image(systemName: "person")
                                                .imageScale(.large)
                                                .foregroundColor(Color("colorIconSelected"))
                                    })
                                }else{
                                    NavigationLink(
                                        destination: LoginUIView(appData: appData),
                                        label: {
                                            Image(systemName: "person").imageScale(.large)
                                                .foregroundColor(Color("colorIcon"))
                                    })
                                }
                            }
                    )
                    
            }
        }
       
    }
}

struct MainUIView_Previews: PreviewProvider {
    static var previews: some View {
        MainUIView(appData: AppData())
    }
}
