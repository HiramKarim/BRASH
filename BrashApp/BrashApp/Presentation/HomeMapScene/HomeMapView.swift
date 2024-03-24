//
//  HomeMapView.swift
//  BrashApp
//
//  Created by Hiram Castro on 22/03/24.
//

import SwiftUI
import MapKit

struct Annotation: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct HomeMapView: View {
    
    @StateObject var vm = HomeMapVM()

    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    
    @State private var textforSearch: String = ""
    
    let annotations: [Annotation] = [
        Annotation(coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194))
    ]
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region,
                interactionModes: .all,
                showsUserLocation: true,
                userTrackingMode: .constant(.follow),
                annotationItems: annotations
            ) { item in
                MapMarker(coordinate: CLLocationCoordinate2D(latitude: 37.7749,
                                                             longitude: -122.4194), tint: .blue)
                }
                .ignoresSafeArea(.all)
                .onAppear(perform: {
                    
                })
            
            VStack {
                HStack {
                    TextField("Search for location", text: $textforSearch)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).foregroundStyle(.white))
                }
                .padding()
                
                Spacer()
                
                HouseInformationCard()
                
            }
        }
    }
}

#Preview {
    HomeMapView()
}
