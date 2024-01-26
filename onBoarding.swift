//
//  onBoarding.swift
//  App SwiftUI
//
//  Created by Theo CACARD on 1/26/24.
//

import SwiftUI

struct onBoarding: View {
    @Binding var selectedTab: Int
    var body: some View {
        
        if selectedTab == 0 {
            VStack{
                Text("Titre")
                Text("Description")
                Image(systemName: "gym.bag.fill")
                Button("Commencer") {
                    UserDefaults.standard.set(true, forKey: "is_On_Boarding_Done")
                }
            }
        }
        else if selectedTab == 1 {
            VStack{
                Text("Titre2")
                Text("Description")
                Image(systemName: "gym.bag.fill")
                Button("Commencer") {
                    UserDefaults.standard.set(true, forKey: "is_On_Boarding_Done")
                }
            }
        }
        
    }
}

//#Preview {
//    @State var number = 10
//    onBoarding(selectedTab: $number)
//}
