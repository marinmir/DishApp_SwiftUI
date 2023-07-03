//
//  MainView.swift
//  DishesApp
//
//  Created by Magina Marina on 30.06.2023.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: MainViewModel
    @Environment(\.profileImage) var profileImage
    
    @State private var categories: [DishCategory] = []
    @State private var isInit = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                Spacer(minLength: 8)
                LazyVStack(spacing: 8) {
                    ForEach(viewModel.categories) { category in
                        NavigationLink {
                            CategoryDetailsView(viewModel: DependenciesFactory.createCategoryDetailsViewModel(for: category))
                                .toolbarRole(.editor)
                        } label: {
                            DishCategoryRowView(category: category)
                        }
                    }
                }
            }
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    profileImage
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    StatusView()
                }
            }
            
        }
        .accentColor(.black)
        .onAppear {
            if !isInit {
                viewModel.onFirstAppear()
                isInit = true
            }
        }
    }
}
