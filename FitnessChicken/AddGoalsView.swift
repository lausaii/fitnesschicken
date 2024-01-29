//
//  AddGoalsView.swift
//  FitnessChicken
//
//  Created by Laurence Sy on 9/5/23.
//
import SwiftUI

struct AddGoalsView: View {
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
                ).accentColor(.orange)
            }
            Section(header: Text("Goal")){
                    TextField("190C/65F/180P", text: $entryItem.iGoalMacros)
                    .limitInputLength(value: $entryItem.iGoalMacros, length: 13)
            }
            
            Section {
                Button("Create") {
                    $entryItem.iEntryTypeDiary.wrappedValue = 2
                    withAnimation{
                        entryContext.insert(entryItem)
                    }
                    dismiss()
                        
                }
            }
        }
    }
}


