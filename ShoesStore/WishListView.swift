//
//  WishListView.swift
//  ShoesStore
//
//  Created by Haryanto Salim on 04/10/23.
//

import SwiftUI

struct WishListView: View {
    var body: some View {
        // Your code for the notes view here
#if !os(macOS)
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            VStack {
                Text("Wishlist")
                
            }
            .navigationTitle("Wishlist")
        } else {
            VStack{
                NavigationView{
                    Text("Wishlist")
                        .navigationTitle("Wishlist")
                }
            }
            
        }
#else
        VStack{
            Text("Wishlist")
            
        }.navigationTitle("Wishlist")
#endif
    }
}


#Preview {
    WishListView()
}
