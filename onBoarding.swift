//
//  onBoarding.swift
//  App SwiftUI
//
//  Created by Theo CACARD on 1/26/24.
//

import SwiftUI

struct OnBoarding: View {
    @Binding var selectedTab: Int
    var title: String
    var image: String
    var description: String
    var current_step: Int
    var body: some View {
        VStack (alignment: .center){
            Spacer()
            Text("\(title)")
                .fontWeight(.bold)
                .font(.system(size: 60))
            Spacer()
            Image(systemName: "\(image)")
                .colorInvert()
                .font(.system(size: 75))
                .frame(width: 200, height: 200)
                .background(.orange)
                .cornerRadius(50)
            Spacer()
            Text("\(description)")
            Spacer()
            if current_step < 2 {
                Button("Suivant") {
                    selectedTab = current_step + 1
                }.padding()
                    .fontWeight(.bold)
                    .frame(width: 150, height: 35)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(5)
            }
            else {
                Button("Commencer") {
                    UserDefaults.standard.set(true, forKey: "is_On_Boarding_Done")
                }.padding()
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(12)
            }
            Spacer()
        }
    }
}

//#Preview {
//    //    @State var number = 0
//    OnBoarding(title: "En un coup d'oeil", image: "iphone.case", description: "Accédez rapidement à vos fonctionnalités clés depuis l'écran d'accueil de votre appareil", current_step: 1)
//}
