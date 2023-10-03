//
//  SaleView.swift
//  ShoesStore
//
//  Created by Haryanto Salim on 04/10/23.
//

import SwiftUI

struct SaleView: View {
    // Sample data
    let shoeses = [
        Shoes(type: "Running Shoes", series: "Shoes 1", brand: "Brand 1", price: 19.99, image: "shoes1", description: "This is shoes 1 description.", availableSize: ["6", "6.5", "7", "7.5", "8"], numOfPromoDays: 1, numOfItemLeft: 2),
        Shoes(type: "Basket Ball Shoes", series: "Shoes 2", brand: "Brand 2", price: 24.99, image: "shoes2", description: "This is shoes 2 description.", availableSize: ["6", "6.5", "7", "7.5", "8"], numOfPromoDays: 2, numOfItemLeft: 3),
        Shoes(type: "Badminton Shoes", series: "Shoes 3", brand: "Brand 3", price: 14.99, image: "shoes3", description: "This is shoes 3 description.", availableSize: ["6", "6.5", "7", "7.5", "8"], numOfPromoDays: 3, numOfItemLeft: 1),
    ]
    var body: some View {
        VStack{
            HStack{
                Text("Lebaran Sale")
                    .font(.custom("SF Pro", size: 26, relativeTo: .headline))
                    .padding(.leading, 18)
                Spacer()
                Text("See All")
                    .font(.custom("SF Pro", size: 15, relativeTo: .headline))
                    .padding(.trailing, 18)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15){
                    ForEach(shoeses, id: \.id){ shoes in
                        VStack(alignment: .leading) {
                            NavigationLink(
                                destination : ShoesDetailView(shoes: shoes),
                                label: {
                                    VStack(alignment: .leading) {
                                        Image(shoes.image)
                                            .resizable()
                                            .scaledToFill()
                                            .background(.yellow)
                                            .frame(width: 149, height: 192)
                                            .cornerRadius(8)
                                        
                                        VStack {
                                            Text(shoes.series)
                                                .font(.headline)
                                            HStack{
                                                Image(systemName: "tag")
                                                    .foregroundColor(.red)
                                                Text("$\(String(format: "%.2f", shoes.price))")
                                                    .font(.subheadline)
                                                    .foregroundColor(.red)
                                            }
                                        }
                                    }
                                    .padding(.bottom, 18)
                                    .offset(x: 18)
                                })
                        }
                    }
                }
            }
        }
        
    }
}

#Preview {
    SaleView()
}
