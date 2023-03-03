//
//  ListView.swift
//  JASA
//
//  Created by Айтолкун Анарбекова on 2/3/23.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                if listViewModel.items.isEmpty {
                    NoItemsView()
                        .transition(AnyTransition.opacity.animation(.easeIn))
                }
                else {
                    List {
                        ForEach(listViewModel.items) { item in
                            ListRowView(item: item)
                                .onTapGesture {
                                    withAnimation(.linear) {
                                        listViewModel.updateItem(item: item)
                                    }
                                }
                        }
                        .onDelete(perform: listViewModel.deleteItem)
                        .onMove (perform: listViewModel.moveItem)
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Todo List")
            
            .toolbar {
                ToolbarItem (placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem {
                    NavigationLink("Add") {
                        AddView()
                    }
                }
            
            }
        
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
    }

}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(ListViewModel())
        
    }
}


