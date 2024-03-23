//
//  HostMapHomeVC.swift
//  BrashApp
//
//  Created by Hiram Castro on 22/03/24.
//

import Foundation
import UIKit
import SwiftUI

final class HostMapHomeVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configOnboarding()
    }
    
    private func configOnboarding() {
        let mapView = HomeMapView()
//        mapView.delegate = self
        let hostingOnboardingView = UIHostingController(rootView: mapView)
        addChild(hostingOnboardingView)
        self.view.addSubview(hostingOnboardingView.view)
        hostingOnboardingView.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            hostingOnboardingView.view.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            hostingOnboardingView.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            hostingOnboardingView.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            hostingOnboardingView.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0)
        ])
    }
}
