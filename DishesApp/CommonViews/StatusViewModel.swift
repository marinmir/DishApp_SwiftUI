//
//  StatusViewModel.swift
//  DishesApp
//
//  Created by Magina Marina on 03.07.2023.
//

import Foundation
import Combine

final class StatusViewModel: ObservableObject {
    @Published var city: String = ""
    
    private let locationManager: LocationManagerProtocol
    private var cancellables: Set<AnyCancellable> = []
    
    init(locationManager: LocationManagerProtocol) {
        self.locationManager = locationManager
    }
    
    func onFirstAppear() {
        locationManager.citySubject.sink { [weak self] city in
            guard let self = self else {
                return
            }
            self.city = city
        }.store(in: &cancellables)
        
        locationManager.startup()
    }
}
