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
                //                .ignoresSafeArea(.all)
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

struct Shoes: Identifiable {
    var id = UUID()
    var type: String
    var series: String
    var brand: String
    var price: Double
    var image: String // Image name or URL
    var description: String
    var availableSize: [String]
    var numOfPromoDays: Int
    var numOfItemLeft: Int
}


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


struct ShoesDetailView: View {
    var shoes: Shoes
    @State var selectedSize: String = "6"
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                ZStack(alignment: .leading) {
                    Image(shoes.image)
                        .resizable()
                        .frame(maxWidth: .infinity, minHeight: 300)
                        .background(.yellow)
                    
                    VStack{
                        Spacer()
                        HStack{
                            Image(systemName: "tag")
                                .padding(.leading, 18)
                            Text("Lebaran Sale!")
                                .font(.custom("SF Pro", size: 15, relativeTo: .subheadline))
                                
                            Spacer()
                            Text("\(shoes.numOfPromoDays) days left")
                                .font(.custom("SF Pro", size: 15, relativeTo: .subheadline))
                                .padding(.trailing, 18)
                        }.padding(8)
                            .background(.thinMaterial)
                        
                    }
                }
                VStack(alignment: .leading){
                    Text(shoes.type)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Text(shoes.series)
                        .font(.title)
                    
                    HStack{
                        Text("$\(String(format: "%.2f", shoes.price))")
                            .font(.custom("SF Pro", size: 17, relativeTo: .subheadline))
                            .padding(.top, 8)
                        Text("$\(String(format: "%.2f", shoes.price * 120 / 100))")
                            .strikethrough(true, color: .gray)
                            .font(.custom("SF Pro", size: 17, relativeTo: .subheadline))
                            .foregroundColor(.gray)
                            .padding(.top, 8)
                        Text("20% off")
                            .font(.custom("SF Pro", size: 17, relativeTo: .subheadline))
                            .foregroundColor(.red)
                            .padding(.top, 8)
                    }
                    .padding(.bottom, 8)
                    
                
                    Text(shoes.description)
                        .font(.body)
                    
                    Text("Size")
                        .font(.custom("SF Pro", size: 17, relativeTo: .body))
                        .padding(.top, 16)
                    
                    Picker("What is your size?", selection: $selectedSize) {
                        ForEach(shoes.availableSize, id: \.self){
                            Text($0).tag($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(.bottom, 8)
                    
                    Text("\(shoes.numOfItemLeft) item left")
                        .font(.custom("SF Pro", size: 13, relativeTo: .body))
                        .foregroundColor(.red)
                    Spacer()
                }.padding()
            }
        }.toolbar(content: {
            Image(systemName: "bag")
        })
    }
}


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

struct AccountView: View {
    var body: some View {
        // Your code for the notes view here
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

struct CouponsView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Special Coupons For you")
                    .font(.custom("SF Pro", size: 26, relativeTo: .headline))
                    .padding(.leading, 18)
                Spacer()
            }
            Image("ses")
                .resizable()
                .frame(maxHeight: 144)
                .scaledToFill()
                .background(.cyan)
                .cornerRadius(8)
                .padding()
        }.padding(.bottom, 18)
    }
}

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
            }.padding(.bottom, 8)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(shoeses, id: \.id){ shoes in
                        NavigationLink {
                            ShoesDetailView(shoes: shoes)
                        } label: {
                            VStack(alignment: .leading, spacing: 4) {
                                Image(shoes.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 149)
                                    .background(.yellow)
                                    .cornerRadius(8)
                                
                                VStack(alignment: .leading, spacing: 4) {
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
                            }.frame(minHeight: 240)
                        }
                        .padding(.bottom, 18)
                    }
                }
            }
            .padding(.leading, 18)
        }
    }
}

struct CreditCardOfferView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Credit Card Offers")
                    .font(.custom("SF Pro", size: 26, relativeTo: .headline))
                    .padding(.leading, 18)
                Spacer()
            }
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 15) {
                    Image("ses")
                        .resizable()
                        .frame(width: 250, height: 150)
                        .scaledToFill()
                        .background(.cyan)
                        .cornerRadius(8)

                    Image("ses")
                        .resizable()
                        .frame(width: 250, height: 150)
                        .scaledToFill()
                        .background(.cyan)
                        .cornerRadius(8)

                    
                }.padding(.leading, 18)
            }
        }
    }
}


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        
//        }
//    }
//}

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
