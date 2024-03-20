//
//  OnboardingView.swift
//  OnboardingModule
//
//  Created by Hiram Castro on 19/03/24.
//

import SwiftUI

public struct OnboardingView: View {
    public init() { }
    public var body: some View {
        ZStack {
            Color.cyan
                .opacity(0.8)
            TabView {
                VStack {
                    Image("rent-1")
                        .resizable()
                        .clipShape(Circle(), style: FillStyle())
                        .frame(width: 300, height: 300)
                    
                    Text("Rent a house!")
                        .font(.title)
                        .bold()
                    
                    Text("Search for houses to rent!")
                        .font(.headline)
                        .foregroundStyle(Color.white)
                    
                    Spacer()
                }
                
                VStack {
                    Image("rent-1")
                        .resizable()
                        .clipShape(Circle(), style: FillStyle())
                        .frame(width: 300, height: 300)
                    
                    Text("Rent a house!")
                        .font(.title)
                        .bold()
                    
                    Text("Search for houses to rent!")
                        .font(.headline)
                        .foregroundStyle(Color.white)
                    
                    Spacer()
                }
                
                VStack {
                    Image("rent-1")
                        .resizable()
                        .clipShape(Circle(), style: FillStyle())
                        .frame(width: 300, height: 300)
                    
                    Text("Rent a house!")
                        .font(.title)
                        .bold()
                    
                    Text("Search for houses to rent!")
                        .font(.headline)
                        .foregroundStyle(Color.white)
                    
                    Spacer()
                    
                    Button("Go to home") {
                        
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding(.bottom, 50)
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingView()
}
