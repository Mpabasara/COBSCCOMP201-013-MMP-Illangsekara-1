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
    @State var selected_cate = "today"
     let controller = Controller();
    @State var foodList:[FoodModel]=[ FoodModel(id: .init(), img: "", name: "name",calories: 900,marked: false,description: "")]
    
    var body: some View {
        
        NavigationView {
            VStack{
                ScrollView(.vertical){
                    HStack{
                        Picker("Picker",selection: Binding(
                            get:{self.selected_cate},
                            set:{self.selected_cate = $0
                                self.getFoodList(category: $0);
                        }), content:{
                            Text("Today").tag("today")
                            Text("Health").tag("health")
                            Text("Common").tag("common")
                            Text("Diet").tag("diet")
                        }).padding(.top, 15.0)
                            .frame(height: 20)
                            .pickerStyle(SegmentedPickerStyle())
                            .scaledToFit()
                    }.padding(.vertical, 10.0).frame(maxWidth: .infinity)
                    
                    VStack{
//                        ForEach(self.foodList, id: \.id) { result in
//                            FoodView(food:result, appData: self.appData,category:self.selected_cate)
//                        }
                    }
                }.navigationBarTitle("Home", displayMode: .inline)
                    .navigationBarItems(leading:
                        HStack {
                            if(appData.isLoggedIn){
                                NavigationLink(
                                    destination: FavouriteUIView(appData: appData),
                                    label: {
                                        Image(systemName: "star").imageScale(.large).foregroundColor(Color("colorIconSelected"))
                                })
                            }
                        }
                        , trailing:
                        HStack {
                            
                        })
                
            }
        }
        
    }
    
    func getFoodList(category:String){
        self.foodList = [];
        
        if(self.appData.appLoaded){
            controller.getFoods(category: category) { (foodList) in
                       self.foodList = foodList;
                   }
        }
       
    }
}

struct MainUIView_Previews: PreviewProvider {
    static var previews: some View {
        MainUIView(appData: AppData())
    }
}
