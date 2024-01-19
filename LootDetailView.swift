//
//  LootDetailView.swift
//  App SwiftUI
//
//  Created by Theo CACARD on 1/19/24.
//

import SwiftUI

struct LootDetailView: View {
    var item: LootItem
    let spring = Spring(duration: 0.2)
    var body: some View {
        // ContentView
        VStack{
            VStack{
                Text("\(item.type.rawValue)")
                    .padding(25)
                    .background(item.rarity.color.gradient)
                    .cornerRadius(12)
                    .shadow(color: item.rarity.color ,radius: 100)
                    .font(.system(size: 30))
                    .onTapGesture {
                        withAnimation(.bouncy){
                            
                        }
                    }
                Text("\(item.name)")
                    .foregroundStyle(item.rarity.color.gradient)
                    .fontWeight(Font.Weight.heavy)
                    .padding(20)
                    .font(.system(size: 30))
                Spacer()
                if item.rarity == Rarity.uniq{
                    ZStack{
                        Rectangle()
                            .fill(item.rarity.color.gradient)
                            .frame(width: 350, height: 50)
                            .cornerRadius(12)
                        Text("Item Unique 🏆")
                            .foregroundColor(.white)
                            .fontWeight(Font.Weight.heavy)
                    }

                }
            }

            Spacer()
            List{
                Section("informations"){
                        HStack{
                            if let coverName = item.game.coverName, let image = UIImage(named: coverName) {
                                                Image(uiImage: image)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 50, height: 50)
                                            }
                            else {
                                Image(systemName: "rectangle.slash").padding(4).frame(height: 58).background(.gray.gradient.opacity(0.4)).cornerRadius(4)
                            }
                            Text("\(item.game.name)")
                        }
                        Text("In-game : \(item.name)")
                        if let attackStrength = item.attackStrength {
                            Text("Puissance (ATQ) : \(attackStrength)")
                        }
                        Text("Possédé(s) : \(item.quantity)")
                        Text("Rareté : \(item.rarity.rawValue)")
                    }
                
            }
        }
    }
}

#Preview {
    LootDetailView(   item: LootItem(id: UUID.init(), quantity: 3, name: "Crystal Sword", type: .bow, rarity: .uniq, attackStrength: 50, game: Game(name: "Elden Ring", genre: .rpg, coverName: "elden_ring")))
}
