//
//  ContentView.swift
//  App SwiftUI
//
//  Created by Theo CACARD on 1/19/24.
//

import SwiftUI


class Inventory : ObservableObject {

    @Published var loot = ["Epée", "Bouclier", "Armure"]
    
    func addItem(withName name: String) {
        loot.append(name)
    }
}

struct ContentView: View {
    @StateObject var inventory = Inventory()
    @State var showAddItemView = false
    
    var body: some View {
        
        NavigationStack{
            List{
                Button(action: {
                    inventory.addItem(withName: "Magie de feu")
                }, label: {
                    Text("Ajouter")
                })
                ForEach(inventory.loot, id: \.self) { item in
                    Text(item)
                }
            }.navigationBarTitle("Loot")
            .toolbar(content: {
                    ToolbarItem(placement: ToolbarItemPlacement.automatic){
                        Button(action: {
                            showAddItemView.toggle()
                        },
                               label: {
                            Image(systemName: "plus.circle.fill")
                        })
                    }
                })
            .sheet(isPresented: $showAddItemView, content: {
                AddItemView().environmentObject(inventory)
            })
        }
    }
}


#Preview {
    ContentView()
}
