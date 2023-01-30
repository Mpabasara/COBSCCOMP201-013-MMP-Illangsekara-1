//
//  FoodUIView.swift
//  HealthFood
//
//  Created by Mobios on 1/26/23.
//  Copyright © 2023 Pabasara. All rights reserved.
//

import SwiftUI

struct FoodUIView: View {
    
    @State var food : FoodModel = FoodModel(id: "0", img: "", name: "",calories:0,marked: false,description: "");
    
    var body: some View {
        
        ZStack {
            VStack{
                ScrollView(.vertical){
                    VStack(alignment: .center, spacing: 0) {
                        Text(food.name)
                        HStack {
                            Text("Calorie Count : ")
                            Text(String(food.calories))
                        }.padding(5)
                        HStack {
                            
                            Text(food.description)
                        }.padding(5)
                        CustomImage(urlString: food.img)
                            .frame(height: 250, alignment: .center).cornerRadius(15)
                    }
                    
                }.padding(10.0)
            }
        }
    }
    
}

struct FoodUIView_Previews: PreviewProvider {
    static var previews: some View {
        FoodUIView()
    }
}
