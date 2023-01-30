//
//  CustomButton.swift
//  HealthFood
//
//  Created by Mobios on 1/26/23.
//  Copyright © 2023 Pabasara. All rights reserved.
//

import SwiftUI

struct CustomButton: View {
    @State var btnTxt : String = "";
     @State var corner : CGFloat = 50;
    var body: some View {
        Text(btnTxt)
        .fontWeight(.bold)
        .foregroundColor(Color("colorText"))
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color("colorBtn"))
        .cornerRadius(corner)
        .padding(.vertical)
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton()
    }
}
