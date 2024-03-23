//
//  HomeMapVM.swift
//  BrashApp
//
//  Created by Hiram Castro on 22/03/24.
//

import Foundation
import MapKit
import CoreLocation
import SwiftUI

final class HomeMapVM: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    
    @Published var mapRegion = MKCoordinateRegion()
    
    var binding: Binding<MKCoordinateRegion> {
        Binding {
            self.mapRegion
        } set: { newRegion in
            self.mapRegion = newRegion
        }
    }
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let previousAuthorizationStatus = manager.authorizationStatus
        manager.requestWhenInUseAuthorization()
        if manager.authorizationStatus != previousAuthorizationStatus {
            checkLocationAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locations.last.map {
            mapRegion = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
            )
        }
    }
    
    private func checkLocationAuthorization() {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            break
        case .restricted:
            break
        case .denied:
            break
        case .authorizedAlways, .authorizedWhenInUse:
            if let location = locationManager.location {
                mapRegion = MKCoordinateRegion(center: location.coordinate,
                                               span: MKCoordinateSpan(latitudeDelta: 0.2,
                                                                      longitudeDelta: 0.2))
            }
        default:
            break
        }
    }
}

class LocationDataManager : NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager = CLLocationManager()
    
    @Published var authorizationStatus: CLAuthorizationStatus?
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse:  // Location services are available.
            // Insert code here of what should happen when Location services are authorized
            authorizationStatus = .authorizedWhenInUse
            locationManager.requestLocation()
            break
            
        case .restricted:  // Location services currently unavailable.
            // Insert code here of what should happen when Location services are NOT authorized
            authorizationStatus = .restricted
            break
            
        case .denied:  // Location services currently unavailable.
            // Insert code here of what should happen when Location services are NOT authorized
            authorizationStatus = .denied
            break
            
        case .notDetermined:        // Authorization not determined yet.
            authorizationStatus = .notDetermined
            manager.requestWhenInUseAuthorization()
            break
            
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Insert code to handle location updates
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error: \(error.localizedDescription)")
    }
}
