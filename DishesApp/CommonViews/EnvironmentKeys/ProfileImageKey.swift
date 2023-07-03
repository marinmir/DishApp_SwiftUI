//
//  ProfileImageKey.swift
//  DishesApp
//
//  Created by Magina Marina on 01.07.2023.
//

import Foundation
import SwiftUI

struct ProfileImageKey: EnvironmentKey {
    static let defaultValue = Image("")
}

extension EnvironmentValues {
    var profileImage: Image {
        get { self[ProfileImageKey.self] }
        set { self[ProfileImageKey.self] = newValue }
    }
}

extension View {
    func profileImage(_ image: Image) -> some View {
        environment(\.profileImage, image)
    }
}
