//
//  CategoryView.swift
//  ShoesStore
//
//  Created by Haryanto Salim on 04/10/23.
//

import SwiftUI

struct CategoryView: View {
    var body: some View {
        // Your code for the store location view here
#if !os(macOS)
        if UIDevice.current.userInterfaceIdiom == .pad {
            VStack{
                Text("Category")
            }
            .navigationTitle("Category")
        } else {
            VStack{
                NavigationView{
                    Text("Category")
                        .navigationTitle("Category")
                }
            }
            
        }
#else
        VStack{
            Text("Category")
            
        }.navigationTitle("Category")
#endif
    }
}

#Preview {
    CategoryView()
}
