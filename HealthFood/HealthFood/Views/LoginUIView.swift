//
//  LoginUIView.swift
//  HealthFood
//
//  Created by Mobios on 1/18/23.
//  Copyright © 2023 Pabasara. All rights reserved.
//

import SwiftUI

struct LoginUIView: View {
    
    @ObservedObject var appData : AppData;
    @Environment(\.presentationMode) var presentationMode
    
    @State var email = "";
    @State var password = "" ;
    
    @State var alertMsg = "" ;
    @State private var showToast = false
    
    var controller = Controller();
    
    var body: some View {
        VStack {
            
            VStack {
                Text("Health Food")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center).padding(.trailing, 5.0)
                HStack {
                    Text("Email")
                        .font(.headline)
                        .multilineTextAlignment(.center).padding(.trailing, 5.0)
                    TextField("",text: $email).keyboardType(.emailAddress).autocapitalization(.none)
                        .frame(width: 250.0, height: 40.0).background(Color(.secondarySystemBackground)).cornerRadius(20)
                }
                
                HStack {
                    
                    Text("Password")
                        .font(.headline)
                        .padding(.top, 10.0)
                    SecureField("",text: $password)
                        .frame(width: 250.0, height: 40.0).background(Color(.secondarySystemBackground)).cornerRadius(20)
                    
                }
                
                Button(action:{
                    self.controller.login(email: self.email, password: self.password) {(success) in
                        
                        if(success){
                            self.controller.getCurLoginUser{(user,i) -> Void in
                                print(user)
                                print("user")
                                self.appData.appLoaded = true;
                                self.appData.isLoggedIn = true;
                                self.appData.user = user;
                                self.presentationMode.wrappedValue.dismiss()
                            }
                        }else{
                            self.alertMsg = "Invalid Email or Password";
                            self.showToast.toggle()
                        }
                    }
                    
                }, label:{
                    CustomButton(btnTxt: "Sign In")
                }).alert(isPresented: $showToast) {
                    Alert(title: Text(alertMsg))
                }
            }.padding(.top, 20.0)
            
            NavigationLink(
                destination: SignUpUIView(),
                label: {
                    CustomButton(btnTxt: "Register")
            }).navigationBarTitle("Login")
            Spacer()
            
            
            Button(action:{
                UIApplication.shared.open(URL(string: "https://www.google.lk")!)
            }, label:{
                Text("Terms & Condition").fontWeight(.regular)
            })
        }.padding(10.0)
    }  
}


struct LoginUIView_Previews: PreviewProvider {
    static var previews: some View {
        LoginUIView(appData: AppData())
    }
}
