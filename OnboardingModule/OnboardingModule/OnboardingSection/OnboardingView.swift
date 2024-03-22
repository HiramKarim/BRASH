//
//  OnboardingView.swift
//  OnboardingModule
//
//  Created by Hiram Castro on 19/03/24.
//

import SwiftUI

private class RentImage {}
internal extension Image {
    static var rent: Image {
        Image("rent-1", bundle: Bundle(for: RentImage.self))
    }
}

public protocol CarousellActionDelegate:AnyObject {
    func finishCarousell()
}

public struct OnboardingView: View {
    
    public var delegate:CarousellActionDelegate!
    
    public init() { }

    public var body: some View {
        ZStack {
            Color.cyan
                .opacity(0.8)
            TabView {
                VStack {
                    Image(.rent1)
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
                    Image(.rent1)
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
                    Image(.rent1)
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
                        delegate.finishCarousell()
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding(.bottom, 50)
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .padding()
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    OnboardingView()
}
