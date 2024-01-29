//
//  UpdateGoalsView.swift
//  FitnessChicken
//
//  Created by Laurence Sy on 9/5/23.
//


import SwiftUI
import SwiftData

struct UpdateGoalsView: View {

    @Environment(\.dismiss) var dismiss
    @Bindable var entryItem: EntryItem
    
    var body: some View {
        VStack{
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
                }
            }
            Text("Data Auto Updates")
        }
        
    }
}

 



