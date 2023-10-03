//
//  CouponsView.swift
//  ShoesStore
//
//  Created by Haryanto Salim on 04/10/23.
//

import SwiftUI

struct CouponsView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Special Coupons For you")
                    .font(.custom("SF Pro", size: 26, relativeTo: .headline))
                Spacer()
            }
                    
            Image("ses")
                .resizable()
                .frame(maxHeight: 144)
                .scaledToFill()
                .background(.cyan)
                .cornerRadius(8)
        }.padding()
    }
}

#Preview {
    CouponsView()
}
