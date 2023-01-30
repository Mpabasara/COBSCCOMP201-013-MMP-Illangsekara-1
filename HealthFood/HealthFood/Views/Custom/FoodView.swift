//
//  FoodView.swift
//  HealthFood
//
//  Created by Mobios on 1/27/23.
//  Copyright © 2023 Pabasara. All rights reserved.
//

import SwiftUI

struct FoodView: View {
    @State var food :FoodModel;
    @State var appData : AppData;
    @State var category = ""
    @State var showFooter = true
    @State var showFoodView = false
    @State var height:CGFloat = 200
    var body: some View {
        HStack{
            CustomImage(urlString: food.img)
            VStack{
                Text(food.name).foregroundColor(.black).frame(maxHeight: 20)
                
                Text("\(food.calories) Calories")
                    .font(.caption)
                    .foregroundColor(Color.black).frame(maxHeight: 20)
                Text(food.description)
                    .font(.caption)
                    .foregroundColor(Color.black).frame(maxHeight: 20)
                Spacer()
                NavigationLink(
                    destination: FoodUIView(food:food),
                    label: {
                        CustomButton(btnTxt: "View",corner: 10)
                })
            }
            
            if(showFooter){
                VStack {
                    if(appData.isLoggedIn){
                        NavigationLink(
                            destination: FavouriteUIView(appData: appData,category: category,addToFavorite:true,foodid:food.id),
                            label: {
                                Image(systemName: "star").foregroundColor(Color("colorIcon"))
                        })
                    }
                    Spacer()
                }
                .padding(5.0)
            }
        }
        .frame(width:350,height: height).padding(5.0)
        .background(Color(hue: 0.566, saturation: 0.0, brightness: 0.91))
        .padding(1.0)
        .cornerRadius(15)
        
        
    }
}


struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView(food:FoodModel(id: .init(), img: "", name: "name",calories: 0,marked: false,description: ""),appData:AppData(),category:"")
    }
}
