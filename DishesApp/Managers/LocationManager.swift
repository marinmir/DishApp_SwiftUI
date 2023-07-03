//
//  LocationManager.swift
//  DishesApp
//
//  Created by Magina Marina on 01.07.2023.
//

import Foundation
import CoreLocation
import Combine

protocol LocationManagerProtocol {
    var citySubject: CurrentValueSubject<String, Never> { get }
    func startup()
}

final class LocationManager: NSObject, LocationManagerProtocol {
    var citySubject = CurrentValueSubject<String, Never>("")
    
    private let locationManager = CLLocationManager()
    
    func startup() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(
        _ manager: CLLocationManager,
        didChangeAuthorization status: CLAuthorizationStatus
    ) {
        switch locationManager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.requestLocation()
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = manager.location else { return }
        
        CLGeocoder().reverseGeocodeLocation(location) { [weak self] placemarks, error in
            self?.citySubject.send(placemarks?.first?.locality ?? "")
        }
    }
}
