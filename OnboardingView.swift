//
//  OnboardingView.swift
//  App SwiftUI
//
//  Created by Theo CACARD on 1/26/24.
//

import SwiftUI

struct OnboardingView: View {
    @State var tabSelected = 1
    var body: some View {
        TabView (selection: $tabSelected){
            onBoarding(selectedTab: $tabSelected).tag(1)
            onBoarding(selectedTab: $tabSelected).tag(2)
        }.indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

#Preview {
    OnboardingView()
}
