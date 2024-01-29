//
//  AddView.swift
//  FitnessChicken
//
//  Created by Laurence Sy on 8/20/23.
//


import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var entryContext
    @State private var entryItem = EntryItem()

    @State private var eMacros = ["x","Under","At", "Over"]
    @State private var eWater = ["x","<70oz", "70-100oz", "100+oz"]
    @State private var eSteps = ["x","<7k", "7-10k","10k+"]
    @State private var eSleep = ["x","<6hrs", "6-8hrs", "8hrs+"]
    @State private var eEatOut = ["x","0", "1-2","3+"]
    @State private var eAlcohol = ["x","0", "1-2","3+"]
    @State private var eFoodQuality = ["x","Poor", "Balanced", "Optimal"]
    
    var body: some View {
        List {
            Section {
                            DatePicker(
                                selection: $entryItem.timestamp,
                                displayedComponents: .date,
                                label: { Text("Entry Date") }
                            ).accentColor(.orange)
                    }
            Section(header: Text("Macros")){
                
                Picker("Macros", selection: $entryItem.iMacros) {
                            ForEach(eMacros.indices, id: \.self) {
                                 Text("\(eMacros[$0])")
                            }
                      }
                .pickerStyle(.segmented)
            }
            Section(header: Text("Water")){
                
                Picker("Water", selection: $entryItem.iWater) {
                            ForEach(eWater.indices, id: \.self) {
                                 Text("\(eWater[$0])")
                            }
                      }
                .pickerStyle(.segmented)
            }
            Section(header: Text("Steps")){
                
                Picker("Steps", selection: $entryItem.iSteps) {
                            ForEach(eSteps.indices, id: \.self) {
                                 Text("\(eSteps[$0])")
                            }
                      }
                .pickerStyle(.segmented)
            }
            Section(header: Text("Sleep")){
                
                Picker("Sleep", selection: $entryItem.iSleep) {
                            ForEach(eSleep.indices, id: \.self) {
                                 Text("\(eSleep[$0])")
                            }
                      }
                .pickerStyle(.segmented)
            }
            Section(header: Text("Eat Out")){
                
                Picker("Eat Out", selection: $entryItem.iEatOut) {
                            ForEach(eEatOut.indices, id: \.self) {
                                 Text("\(eEatOut[$0])")
                            }
                      }
                .pickerStyle(.segmented)
            }
            Section(header: Text("Alcohol")){
                
                Picker("Alcohol", selection: $entryItem.iAlcohol) {
                            ForEach(eAlcohol.indices, id: \.self) {
                                 Text("\(eAlcohol[$0])")
                            }
                      }
                .pickerStyle(.segmented)
            }
            Section(header: Text("Food Quality")){
                
                Picker("Food Quality", selection: $entryItem.iFoodQuality) {
                            ForEach(eFoodQuality.indices, id: \.self) {
                                 Text("\(eFoodQuality[$0])")
                            }
                      }
                .pickerStyle(.segmented)
            }
            Section {
                Button("Create") {
                    //$entryItem.iEntryType == true //look up how to assgin value manually
                    withAnimation{
                        entryContext.insert(entryItem)
                    }
                    dismiss()
                        
                }
            }
        }
    }
}

#Preview {
    //ContentView()
    AddView()
        .modelContainer(for: EntryItem.self)
}
 

