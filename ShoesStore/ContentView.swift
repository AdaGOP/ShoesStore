//
//  ContentView.swift
//  ShoesStore
//
//  Created by Haryanto Salim on 03/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @Binding var selectedTab: Tab?
    
    var body: some View {
        
#if os(iOS)
        if UIDevice.current.userInterfaceIdiom == .pad {
            NavigationView{
                List{
                    NavigationLink {
                        ShoesView()
                    } label: {
                        Label("Offers", systemImage: "tag")
                    }
                    NavigationLink {
                        CategoryView()
                    } label: {
                        Label("Category", systemImage: "list.bullet")
                    }
                    NavigationLink {
                        WishListView()
                    } label: {
                        Label("Wishlist", systemImage: "heart")
                    }
                    NavigationLink {
                        AccountView()
                    } label: {
                        Label("Account", systemImage: "person")
                    }
                }
            }
        } else {
            NavigationView{
                TabView {
                    ShoesView()
                        .tabItem {
                            Image(systemName: "tag")
                            Text("Offers")
                        }
                        .tag(Tab.offers)
                    
                    CategoryView()
                        .tabItem {
                            Image(systemName: "list.bullet")
                            Text("Category")
                        }
                        .tag(Tab.category)
                    
                    WishListView()
                        .tabItem {
                            Image(systemName: "heart")
                            Text("Wishlist")
                        }
                        .tag(Tab.wishlist)
                    AccountView()
                        .tabItem {
                            Image(systemName: "person")
                            Text("Account")
                        }
                        .tag(Tab.wishlist)
                }
                .frame(
                    width: UIScreen.main.bounds.width ,
                    height: UIScreen.main.bounds.height
                )
            }
        }
        
#elseif os(macOS)
        NavigationView {
            List {
                NavigationLink {
                    ShoesView()
                } label: {
                    Label("Offers", systemImage: "tag")
                }
                NavigationLink {
                    CategoryView()
                } label: {
                    Label("Category", systemImage: "list.bullet")
                }
                NavigationLink {
                    WishListView()
                } label: {
                    Label("Wishlist", systemImage: "heart")
                }
                NavigationLink {
                    AccountView()
                } label: {
                    Label("Account", systemImage: "person")
                }
            }
            .listStyle(SidebarListStyle())
            
            switch selectedTab {
            case .offers:
                ShoesView()
            case .category:
                CategoryView()
            case .wishlist:
                WishListView()
            case .account:
                AccountView()
            case .none:
                Text("None")
            }
            
        }
#endif
    }
}

#if !os(macOS)
#Preview {
        ContentView(selectedTab: .constant(.offers))
            .previewDevice("iPhone 14 Pro")
}

#Preview {
    ContentView(selectedTab: .constant(.offers))
        .previewDevice("iPad Air")
//        .previewDevice("iPad Air (5th generation)")
        .previewInterfaceOrientation(.landscapeLeft)
}

#elseif os(macOS)
#Preview {
    ContentView(selectedTab: .constant(.offers))
        .previewDevice("My Mac")
}
#endif
