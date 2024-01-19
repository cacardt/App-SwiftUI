//
//  LootItem.swift
//  App SwiftUI
//
//  Created by Theo CACARD on 1/19/24.
//

import Foundation

struct LootItem: Hashable, Identifiable{
    var id: UUID
    
    var quantity: Int = 1
    var name: String = ""
    var type: ItemType = ItemType.bow
    var rarity: Rarity = Rarity.uniq
    var attackStrength: Int?
    var game: Game = Game.emptyGame
}

enum ItemType: String, CaseIterable {
    case magic = "⭐️"
    case fire = "🔥"
    case ice = "❄️"
    case wind = "💨"
    case poison = "☠️"
    case thunder = "⚡️"
    case dagger = "🗡️"
    case shield = "🛡️"
    case bow = "🏹"
    case ring = "💍"
    case unknown = "🎲"

}

let lootItems: [LootItem] = [
    LootItem(id: UUID.init(), quantity: 3, name: "Crystal Sword", type: .magic, rarity: .epic, attackStrength: 50, game: Game(name: "Elden Ring", genre: .rpg, coverName: "elden_ring")),
    LootItem(id: UUID.init(), quantity: 1, name: "Flame Bow", type: .fire, rarity: .legendary, attackStrength: 70, game: Game(name: "Skyrim", genre: .rpg, coverName: "skyrim")),
    LootItem(id: UUID.init(), quantity: 5, name: "Ice Dagger", type: .ice, rarity: .rare, attackStrength: 30, game: Game(name: "WoW", genre: .mmorpg, coverName: "wow")),
    LootItem(id: UUID.init(), quantity: 2, name: "Wind Cloak", type: .wind, rarity: .uncommon, attackStrength: 10, game: Game(name: "Diablo IV", genre: .looter, coverName: "diablo_IV")),
    LootItem(id: UUID.init(), quantity: 4, name: "Poison Ring", type: .poison, rarity: .uniq, attackStrength: 20, game: Game(name: "CS:GO", genre: .fps, coverName: nil))
]

