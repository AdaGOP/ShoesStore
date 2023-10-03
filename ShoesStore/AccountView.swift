//
//  AccountView.swift
//  ShoesStore
//
//  Created by Haryanto Salim on 04/10/23.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
#if !os(macOS)
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            VStack {
                Text("Account")
                
            }
            .navigationTitle("Account")
        } else {
            VStack{
                NavigationView{
                    Text("Account")
                        .navigationTitle("Account")
                }
            }
            
        }
#else
        VStack{
            Text("Account")
            
        }.navigationTitle("Account")
#endif
    }
}

#Preview {
    AccountView()
}
