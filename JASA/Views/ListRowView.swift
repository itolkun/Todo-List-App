//
//  ListRowView.swift
//  JASA
//
//  Created by Айтолкун Анарбекова on 2/3/23.
//

import SwiftUI

struct ListRowView: View {
    
    var item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "checkmark.circle")
                .foregroundColor(item.isCompleted ? .green : .gray)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var itemOne = ItemModel(title: "first", isCompleted: false)
    static var itemTwo = ItemModel(title: "second", isCompleted: true)
    static var previews: some View {
        Group {
            ListRowView(item: itemOne)
            ListRowView(item: itemTwo)
        }
        .previewLayout(.sizeThatFits)
    }
}
