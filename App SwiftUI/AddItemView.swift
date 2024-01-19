//
//  AddItemView.swift
//  App SwiftUI
//
//  Created by Theo CACARD on 1/19/24.
//

import SwiftUI

struct AddItemView: View {
    @StateObject var inventory = Inventory()
    @State private var isSheetPresented = false
    @State var name = ""
    @State var rarity = ""
    var body: some View {
        Form {
            Section{
                TextField("Nom de l'objet", text: $name)
                Picker("Rarete", selection: $rarity){
                    ForEach(Rarity.allCases, id: \.self){ rarity in
                        Text(String(describing: rarity).capitalized)
                    }
                }
            }
        }
        Button(action: {
            inventory.addItem(withName: name)
        }, label: {
            Text("Ajouter")
        })
    }
}
enum Rarity: CaseIterable{
    case common
    case uncommon
    case rare
    case epic
    case legendary
    case uniq
    
}

#Preview {
    AddItemView()
}
