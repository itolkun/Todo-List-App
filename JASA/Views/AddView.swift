//
//  AddView.swift
//  JASA
//
//  Created by Айтолкун Анарбекова on 2/3/23.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText = ""
    @State var alertTitle = ""
    @State var showALert = false

    
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type someting here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(.secondarySystemBackground))
                .cornerRadius(15)
                
                Button {
                    saveButtonPressed()
                } label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }

            }
            .padding(14)
        }
        .navigationTitle("Add an Item 🖊️")
        .alert("Attention", isPresented: $showALert, actions: {}) {
            Text("Your todo item must be at least 3 characters")
        }
        
        
    }
    private func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            dismiss()
        }
    }
    private func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            showALert.toggle()
            return false
        }
        return true
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
                .environmentObject(ListViewModel())
        }
    }
}
