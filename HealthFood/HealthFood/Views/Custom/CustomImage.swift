//
//  CustomImage.swift
//  HealthFood
//
//  Created by Mobios on 1/27/23.
//  Copyright © 2023 Pabasara. All rights reserved.
//

import SwiftUI

struct CustomImage: View {
    var urlString: String
    @ObservedObject var imageLoader = ImageLoaderService()
    @State var image: UIImage = UIImage()
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width:220, height:150)
            .onReceive(imageLoader.$image) { image in
                self.image = image
        }
        .onAppear {
            self.imageLoader.loadImage(for: self.urlString)
        }
    }
}
class ImageLoaderService: ObservableObject {
    @Published var image: UIImage = UIImage()
    func loadImage(for urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data) ?? UIImage()
            }
        }
        task.resume()
    }
    
}
