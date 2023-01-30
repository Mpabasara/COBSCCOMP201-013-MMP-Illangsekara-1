//
//  FavouriteUIView.swift
//  HealthFood
//
//  Created by Mobios on 1/26/23.
//  Copyright © 2023 Pabasara. All rights reserved.
//

import SwiftUI

struct FavouriteUIView: View {
    @ObservedObject var appData : AppData
    var controller = Controller();
    @State var category = "";
    @State var addToFavorite : Bool = false
    
    @State var foodList  : [FoodModel]=[ FoodModel(id: .init(), img: "", name: "name",calories: 0,marked: false,description: "")]
    
    @State var foodid : String = "";
    
    var body: some View {
        
        ZStack(alignment: .center) {
            
            ScrollView(.vertical){
                VStack{
                    
                    Text("My Favorite").font(.headline).fontWeight(.bold)
                    ForEach(0..<foodList.count, id: \.self) { index in
                        VStack{
                            FoodView(food:self.foodList[index],appData:self.appData,showFooter: false)
                        }
                    }
                }
            }
        }.onAppear(){
            if(self.addToFavorite){
                self.controller.markAsFavourite(category: self.category, id: self.foodid, user: self.appData.user!)
            }
            self.foodList = [];
            
        }.frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .center
        )
    }
}

struct FavouriteUIView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteUIView(appData: AppData())
    }
}
