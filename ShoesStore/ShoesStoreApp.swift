//
//  ShoesStoreApp.swift
//  ShoesStore
//
//  Created by Haryanto Salim on 03/10/23.
//

import SwiftUI

@main
struct ShoesStoreApp: App {
    @State private var selectedTab: Tab? = Tab.offers
        
        var body: some Scene {
            #if os(iOS)
            WindowGroup {
                ContentView(selectedTab: $selectedTab)
                    .frame(minWidth: 800, idealWidth: 1000, maxWidth: .infinity, minHeight: 600, idealHeight: 800, maxHeight: .infinity)
            }
            #elseif os(macOS)
            WindowGroup {
                ContentView(selectedTab: $selectedTab)
                    .frame(minWidth: 800, idealWidth: 1000, maxWidth: .infinity, minHeight: 600, idealHeight: 800, maxHeight: .infinity)
            }
            .commands {
                SidebarCommands()
            }
            #endif
        }
}
