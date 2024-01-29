//
//  AddView.swift
//  FitnessChicken
//
//  Created by Laurence Sy on 8/20/23.
//


import SwiftUI
import SwiftData

struct UpdateWeightView: View {

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
                Section(header: Text("Weight")){
                        TextField("130 lbs", text: $entryItem.iWeight)
                }
            }
            Text("Data Auto Updates")
        }
        
    }
}

 


