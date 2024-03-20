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
        let onboardingView = UIHostingController(rootView: OnboardingView())
        addChild(onboardingView)
        self.view.addSubview(onboardingView.view)
        onboardingView.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            onboardingView.view.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            onboardingView.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            onboardingView.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            onboardingView.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0)
        ])
    }
}
