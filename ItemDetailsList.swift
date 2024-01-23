//
//  ItemDetailsList.swift
//  App SwiftUI
//
//  Created by Theo CACARD on 1/23/24.
//

import SwiftUI

struct ItemDetailsList: View {
    var item: LootItem
    var body: some View {
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

#Preview {
    ItemDetailsList(item: LootItem(id: UUID.init(), quantity: 3, name: "Crystal Sword", type: .bow, rarity: .uniq, attackStrength: 50, game: Game(name: "Elden Ring", genre: .rpg, coverName: "elden_ring")))
}
