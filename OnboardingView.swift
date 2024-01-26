//
//  OnboardingView.swift
//  App SwiftUI
//
//  Created by Theo CACARD on 1/26/24.
//

import SwiftUI


struct Views {
    let title: String
    let image: String
    let description: String
    
    static var emptyViews = Views(title: "", image: "", description: "")
}

var firstView = Views(title: "Gérer ses loots", image: "gym.bag.fill", description: "Ajoutez facilement vos trouvailles et vos achats à votre collection personnelle.")
var secondView = Views(title: "Votre whitelist", image: "wand.and.stars", description: "Créez une liste de souhait pour garder une trace des articles que vous voulez acquérir.")
var thirdView = Views(title: "En un coup d'oeil", image: "iphone.case", description: "Accédez rapidement à vos fonctionnalités clés depuis l'écran d'accueil de votre appareil")

struct OnboardingView: View {
    @State var tabSelected = 0
    var body: some View {
        TabView (selection: $tabSelected){
            OnBoarding(selectedTab: $tabSelected, title: firstView.title,image: firstView.image, description: firstView.description, current_step: 0).tag(0)
            OnBoarding(selectedTab: $tabSelected, title: secondView.title,image: secondView.image, description: secondView.description, current_step: 1).tag(1)
            OnBoarding(selectedTab: $tabSelected, title: thirdView.title,image: thirdView.image, description: thirdView.description, current_step: 2).tag(2)
        }.tabViewStyle(.page)
    }
}

#Preview {
    OnboardingView()
}
