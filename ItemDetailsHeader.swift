//
//  ItemDetailsHeader.swift
//  App SwiftUI
//
//  Created by Theo CACARD on 1/23/24.
//

import SwiftUI

struct ItemDetailsHeader: View {
    
    @State private var recto: Bool = true
    @State var isAppeared: Bool = false
    var item: LootItem
    var body: some View {
        VStack{
            Text("\(item.type.rawValue)")
                .task {
                    do {
                        try await Task.sleep(nanoseconds: 400000000)
                        isAppeared = true
                    } catch {
                        print("error")
                    }
                }
                .padding(25)
                .background(item.rarity.color.gradient)
                .cornerRadius(12)
                .shadow(color: item.rarity.color, radius: isAppeared ? 50 : 0)
                .animation(.bouncy.delay(0.5), value: isAppeared)
                .font(.system(size: 30))
                .rotation3DEffect(.degrees(isAppeared ? 360 : 0), axis: (x: 1.0, y: 1.0, z: 0.0))
                .animation(.spring, value: isAppeared)
            
            Text(isAppeared ? "\(item.name)" : "")
                .animation(.easeOut.delay(0.5), value: isAppeared)
                .foregroundStyle(item.rarity.color.gradient)
                .fontWeight(Font.Weight.heavy)
                .padding(20)
                .font(.system(size:30 ))
                .rotation3DEffect(.degrees(recto ? 0 : 180), axis: (x: 0.0, y: 1.0, z: 0.0))
                .onTapGesture {
                    withAnimation {
                        recto.toggle()
                    }
                }
            Spacer()
            if item.rarity == Rarity.uniq{
                ZStack{
                    Rectangle()
                        .fill(item.rarity.color.gradient)
                        .frame(width: isAppeared ? 350: 0, height: isAppeared ? 50 : 0)
                        .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/, value: isAppeared)
                        .cornerRadius(12)
                    Text(isAppeared ? "Item Unique 🏆" : "")
                        .animation(.easeIn.delay(0.2), value: isAppeared)
                        .foregroundColor(.white)
                        .fontWeight(Font.Weight.heavy)
                    
                }
            }
        }
    }
}

#Preview {
    ItemDetailsHeader(item: LootItem(id: UUID.init(), quantity: 3, name: "Crystal Sword", type: .bow, rarity: .uniq, attackStrength: 50, game: Game(name: "Elden Ring", genre: .rpg, coverName: "elden_ring")))
}
