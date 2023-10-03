//
//  ShoesView.swift
//  ShoesStore
//
//  Created by Haryanto Salim on 04/10/23.
//

import SwiftUI

struct ShoesView: View {
    var body: some View {
        // Your code for displaying a list of shoes here
#if !os(macOS)
        if UIDevice.current.userInterfaceIdiom == .pad {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 1) {
                        Divider()
                        CouponsView()

                        SaleView()

                        CreditCardOfferView()
                    }
                }
                .toolbar(content: {
                    Image(systemName: "bag")
                })
                
            }
            .navigationTitle("Offers")
        } else {
            VStack{
                NavigationView{
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 1) {
                            Divider()
                            CouponsView()

                            SaleView()

                            CreditCardOfferView()
                        }
                    }
                    .toolbar(content: {
                        Image(systemName: "bag")
                    })
                }
            }
            
        }
#else
        VStack{
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 1) {
                    Divider()
                    CouponsView()

                    SaleView()

                    CreditCardOfferView()
                }
            }
            .toolbar(content: {
                Image(systemName: "bag")
            })
            
        }.navigationTitle("Offers")
#endif
        
    }
}

#Preview {
    ShoesView()
}
