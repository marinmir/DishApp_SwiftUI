//
//  ContentView.swift
//  DishesApp
//
//  Created by Magina Marina on 30.06.2023.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var statusViewModel: StatusViewModel
    @State var isInit = false
    
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image("mainTabBar")
                        .renderingMode(.template)
                    Text("Главная")
                }
            
            SearchView()
                .tabItem {
                    Image("searchTabBar")
                        .renderingMode(.template)
                    Text("Поиск")
                }
            
            CartView()
                .tabItem {
                    Image("cartTabBar")
                        .renderingMode(.template)
                    Text("Корзина")
                }
            
            AccountView()
                .tabItem {
                    Image("accountTabBar")
                        .renderingMode(.template)
                    Text("Аккаунт")
                }
            
            
        }
        .profileImage(Image("profileImage"))
        .onAppear {
            if !isInit {
                statusViewModel.onFirstAppear()
                isInit = true
            }
        }
        
    }
}
