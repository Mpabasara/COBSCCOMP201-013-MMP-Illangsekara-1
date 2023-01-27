//
//  SignUpUIView.swift
//  HealthFood
//
//  Created by Mobios on 1/18/23.
//  Copyright © 2023 Pabasara. All rights reserved.
//

import SwiftUI

struct SignUpUIView: View {
    
    @State var name = "";
    @State var email = "";
    @State var password = "";
    @State var gender = "";
    
    @Environment(\.presentationMode) var presentationMode
    
    var controller = Controller();
    var validation = Validation();
    
    @State var alertMsg = "" ;
    @State private var showToast = false
    
    var body: some View {
        
        ZStack {
            ScrollView(.vertical){
                VStack(alignment: .center){
                    VStack{
                        Text("Email").font(.title)
                        TextField("",text: self.$email).keyboardType(.emailAddress).autocapitalization(.none).frame(width: 250.0, height: 30.0).background(Color(.secondarySystemBackground)).cornerRadius(50.0)
                        
                        Text("Password").font(.title)
                        SecureField("",text: self.$password)
                            .frame(width: 250.0, height: 30.0).background(Color(.secondarySystemBackground))
                    }.padding(.top, 20.0).cornerRadius(50.0)
                    
                    Text("Name").font(.title)
                    TextField("",text: self.$name)
                        .frame(width: 250.0, height: 30.0).background(Color(.secondarySystemBackground)).cornerRadius(50.0)
                    
                    Text("Gender").font(.title)
                    TextField("",text: self.$gender)
                        .frame(width: 250.0, height: 30.0).background(Color(.secondarySystemBackground)).cornerRadius(50.0)
                    
                    VStack{
                        Button(action:{
                            self.registerUser()
                            
                        }, label:{
                            CustomButton(btnTxt: "Register")
                            
                        })
                    }.padding(.top, 20.0)
                }.padding(10.0)
                
            }
        }
    }
    
    func registerUser(){
        if(self.email.isEmpty){
            self.alertMsg = "Please Enter Email";
            return;
        }
        
        if(!self.validation.validateEmail(self.email)){
            self.alertMsg =  "Invalid Email";
            return;
        }
        if(self.password.isEmpty){
            self.alertMsg = "Please Enter Password";
            return;
        }
        if(!self.validation.validatePassword(self.password)){
            self.alertMsg = "Password at least 8 characters";
            return;
        }
        
        self.controller.registerUser(email: self.email, password: self.password, name: self.name, gender: self.gender) {(success) in
            if(success){
                self.alertMsg = "Success";
                self.presentationMode.wrappedValue.dismiss()
            }else{
                self.alertMsg =  "Failed"
            }
        }
    }
    
}


struct SignUpUIView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpUIView()
    }
}
