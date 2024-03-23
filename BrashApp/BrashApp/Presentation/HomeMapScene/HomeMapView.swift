//
//  HomeMapView.swift
//  BrashApp
//
//  Created by Hiram Castro on 22/03/24.
//

import SwiftUI
import MapKit

struct HomeMapView: View {
    
    @StateObject var vm = HomeMapVM()
    @StateObject var locationDataManager = LocationDataManager()
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $vm.mapRegion,
                showsUserLocation: true
            )
                .ignoresSafeArea(.all)
                .onAppear(perform: {
                    
                })
        }
    }
}

#Preview {
    HomeMapView()
}
