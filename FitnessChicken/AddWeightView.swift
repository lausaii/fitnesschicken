//
//  AddView.swift
//  FitnessChicken
//
//  Created by Laurence Sy on 8/20/23.
//


import SwiftUI

struct TextFieldLimitModifer: ViewModifier {
    @Binding var value: String
    var length: Int

    func body(content: Content) -> some View {
        content
            .onReceive(value.publisher.collect()) {
                value = String($0.prefix(length))
            }
    }
}

extension View {
    func limitInputLength(value: Binding<String>, length: Int) -> some View {
        self.modifier(TextFieldLimitModifer(value: value, length: length))
    }
}


struct AddWeightView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var entryContext
    @State private var entryItem = EntryItem()
    
    
    var body: some View {
        List {
            Section {
                DatePicker(
                    selection: $entryItem.timestamp,
                    displayedComponents: .date,
                    label: { Text("Entry Date") }
                ).accentColor(.indigo)
            }
            Section(header: Text("Weight")){
                    TextField("130 lbs", text: $entryItem.iWeight)
                    .limitInputLength(value: $entryItem.iWeight, length: 13)
            }
            
            Section {
                Button("Create") {
                    $entryItem.iEntryTypeDiary.wrappedValue = 1
                    withAnimation{
                        entryContext.insert(entryItem)
                    }
                    dismiss()
                        
                }
            }
        }
    }
}


