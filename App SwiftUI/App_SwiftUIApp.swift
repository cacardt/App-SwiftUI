//
//  App_SwiftUIApp.swift
//  App SwiftUI
//
//  Created by Theo CACARD on 1/19/24.
//

import SwiftUI

@main
struct App_SwiftUIApp: App {
    
    @AppStorage("is_On_Boarding_Done") var isOnBoardingDone: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if isOnBoardingDone {
                ContentView()
            }
            else {
                OnboardingView()
            }

        }
    }
}
