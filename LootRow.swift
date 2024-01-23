//
//  LootRow.swift
//  App SwiftUI
//
//  Created by Theo CACARD on 1/23/24.
//

import SwiftUI

struct LootRow: View {
    var item: LootItem
    var body: some View {
        HStack {
            
            Circle()
                .fill(item.rarity.color)
                .frame(width: 10, height: 10)
            Text(item.type.rawValue)
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text("Quantité : \(item.quantity)")
                    .font(.subheadline)
            }
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    LootRow(item: LootItem(id: UUID.init(), quantity: 3, name: "Crystal Sword", type: .bow, rarity: .uniq, attackStrength: 50, game: Game(name: "Elden Ring", genre: .rpg, coverName: "elden_ring")))
}
