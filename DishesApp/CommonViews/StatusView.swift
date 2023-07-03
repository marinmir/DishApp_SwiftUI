//
//  StatusView.swift
//  DishesApp
//
//  Created by Magina Marina on 01.07.2023.
//

import SwiftUI

struct StatusView: View {
    @EnvironmentObject var statusViewModel: StatusViewModel
    
    @State private var date = Date.now
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: Locale.preferredLanguages.first ?? "en")
        dateFormatter.dateFormat = "d MMMM, yyyy"
        return dateFormatter
    }()
    
    var body: some View {
        HStack(alignment: .top) {
            Image("geoPin")
                .frame(width: 24, height: 24)
            
            Spacer()
                .frame(width: 4)
            
            VStack(alignment: .leading) {
                Text(statusViewModel.city)
                    .font(.system(size: 18, weight: .medium))
                Text(dateFormatter.string(from: date))
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.black.opacity(0.5))
            }
        }
    }
}
