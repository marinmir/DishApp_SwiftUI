//
//  TagView.swift
//  DishesApp
//
//  Created by Magina Marina on 02.07.2023.
//

import SwiftUI

struct TagView: View {
    var tag: String
    var isSelected: Bool
    
    var body: some View {
        Text(tag)
            .font(.system(size: 14, weight: .regular))
            .foregroundColor(getTextColor())
            
            .lineLimit(1)
            .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
            .background(getBackgroundColor())
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(getBackgroundColor()))
    }
    
    private func getBackgroundColor() -> Color {
        return isSelected ? Color("AccentColor") : Color("grayBackground")
    }
    
    private func getTextColor() -> Color {
        return isSelected ? .white : .black
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(tag: "Example tag", isSelected: true)
    }
}
