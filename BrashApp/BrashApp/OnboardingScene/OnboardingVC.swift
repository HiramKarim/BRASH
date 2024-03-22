//
//  OnboardingVC.swift
//  BrashApp
//
//  Created by Hiram Castro on 19/03/24.
//

import UIKit
import SwiftUI
import OnboardingModule

class OnboardingVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configOnboarding()
    }
    
    private func configOnboarding() {
        var onboardingView = OnboardingView()
        onboardingView.delegate = self
        let hostingOnboardingView = UIHostingController(rootView: onboardingView)
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

extension OnboardingVC: CarouselActionDelegate {
    func finishCarousel() {
        print("continue to another section")
    }
}
