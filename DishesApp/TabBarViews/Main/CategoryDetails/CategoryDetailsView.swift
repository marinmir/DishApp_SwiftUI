//
//  CategoryDetailsView.swift
//  DishesApp
//
//  Created by Magina Marina on 01.07.2023.
//

import SwiftUI

struct CategoryDetailsView: View {
    @StateObject var viewModel: CategoryDetailsViewModel
    @Environment(\.profileImage) var profileImage
    
    @State private var dishes: [Dish] = []
    @State private var selectedDish: Dish?
    @State private var shouldShowDishDetails = false
    @State private var isInit = false
    
    let columns = [
        GridItem(.flexible(), alignment: .top),
        GridItem(.flexible(), alignment: .top),
        GridItem(.flexible(), alignment: .top)]
    
    var body: some View {
        ZStack {
            ScrollView {
                Spacer()
                    .frame(height: 8)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(viewModel.tags, id: \.self) { tag in
                            TagView(tag: tag, isSelected: viewModel.selectedTags.contains(tag))
                                .onTapGesture {
                                    viewModel.onTagTap(tag)
                                }
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                }
                
                Spacer()
                    .frame(height: 16)
                
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(viewModel.dishes) { dish in
                        
                        DishCardView(dish: dish)
                            .onTapGesture {
                                selectedDish = dish
                                shouldShowDishDetails = true
                            }
                            
                    }
                }
                .padding(.horizontal)
            }
            
            if shouldShowDishDetails {
                GeometryReader { geometry in
                    DishDetailsCardView(dish: selectedDish!, isVisible: $shouldShowDishDetails)
                        .padding(.horizontal, 16)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                }
                .background(
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.all))
                .onTapGesture {
                    shouldShowDishDetails = false
                }
                
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                profileImage
            }
        }
        .navigationTitle(viewModel.categoryName)
        .onAppear {
            if !isInit {
                viewModel.onFirstAppear()
                isInit = true
            }
        }
    }
}
