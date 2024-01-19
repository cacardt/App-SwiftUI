//
//  ContentView.swift
//  App SwiftUI
//
//  Created by Theo CACARD on 1/19/24.
//

import SwiftUI


class Inventory : ObservableObject {

    @Published var loot = lootItems
    
    func addItem(withItem item: LootItem) {
        loot.append(item)
    }
}

struct ContentView: View {
    @StateObject var inventory = Inventory()
    @State var showAddItemView = false
    
    var body: some View {
        
        NavigationStack{
            List{
                ForEach(inventory.loot, id: \.self) { item in
                    NavigationLink{
                        LootDetailView(item: item)
                    }label: {
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
