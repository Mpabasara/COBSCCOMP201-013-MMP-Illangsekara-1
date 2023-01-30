//
//  MyProfileUIView.swift
//  HealthFood
//
//  Created by Mobios on 1/26/23.
//  Copyright © 2023 Pabasara. All rights reserved.
//

import SwiftUI

struct MyProfileUIView: View {
    @ObservedObject var appData : AppData;
    @State var user : UserModel =  UserModel(id: "", userid: 0 ,gender: "",name: "",email: "")
    @Environment(\.presentationMode) var presentationMode
    var controller = Controller();
    var body: some View {
        ZStack{
            Form {
                Image("food")
                    .resizable()
                    .clipped()
                    .frame(width: 100, height: 100, alignment: .center)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.blue, lineWidth: 2.0))
                Section(header: Text("Basic Information")) {
                    HStack {Text("Email");
                        Spacer(minLength: 100);
                        Text(appData.user?.email ?? "")}
                    HStack {Text("Name");
                        Spacer(minLength: 100);
                        Text(appData.user?.name ?? "" )}
                    HStack {Text("Gender");
                        Spacer(minLength: 100);
                        Text(appData.user?.gender ?? "" )}
                }
                
                
            }
        }.navigationBarTitle("User", displayMode: .inline)
            .navigationBarItems(trailing:
                HStack {
                    Button(action:{
                        self.appData.isLoggedIn = false;
                        self.controller.signOut()
                        self.presentationMode.wrappedValue.dismiss()
                    }, label:{
                        Image(systemName: "person")
                            .imageScale(.large)
                            .foregroundColor(Color("colorIconSelected"))
                    })
                } 
        )
    }
}

struct MyProfileUIView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileUIView(appData: AppData())
    }
}
