//
//  Entry.swift
//  FitnessChicken
//
//  Created by Laurence Sy on 8/15/23.
//

import SwiftUI
import SwiftData
import Foundation

public var cellWidthHeader:CGFloat = 80
public var cellWidth:CGFloat = (UIScreen.main.bounds.width - 80)/7
public var cellHeightHeader:CGFloat = 120
public var cellHeight:CGFloat = 40
public var cellBorderWidth:CGFloat = 0.2
public var cellBorderColor: Color = Color.white

struct EntryHeader: View {
    var body: some View {
        VStack{
            HStack(alignment: .top, spacing: 0) {
                Text("Date").fixedSize().rotationEffect(.degrees(-90)).frame(width: cellWidthHeader, height: cellHeightHeader).border(cellBorderColor, width: cellBorderWidth)
                Text("Macros").fixedSize().rotationEffect(.degrees(-90)).frame(width: cellWidth, height: cellHeightHeader).border(cellBorderColor, width: cellBorderWidth)
                Text("Water").fixedSize().rotationEffect(.degrees(-90)).frame(width: cellWidth, height: cellHeightHeader).border(cellBorderColor, width: cellBorderWidth)
                Text("Steps").fixedSize().rotationEffect(.degrees(-90)).frame(width: cellWidth, height: cellHeightHeader).border(cellBorderColor, width: cellBorderWidth)
                Text("Sleep").fixedSize().rotationEffect(.degrees(-90)).frame(width: cellWidth, height: cellHeightHeader).border(cellBorderColor, width: cellBorderWidth)
                Text("Eat out").fixedSize().rotationEffect(.degrees(-90)).frame(width: cellWidth, height: cellHeightHeader).border(cellBorderColor, width: cellBorderWidth)
                Text("Alcohol").fixedSize().rotationEffect(.degrees(-90)).frame(width: cellWidth, height: cellHeightHeader).border(cellBorderColor, width: cellBorderWidth)
                Text("Food Quality").fixedSize().rotationEffect(.degrees(-90)).frame(width: cellWidth, height: cellHeightHeader).border(cellBorderColor, width: cellBorderWidth)
            }
        }
    }
}
struct EntryAdd: View {
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            Text("Date").frame(height: 40).border(cellBorderColor, width: cellBorderWidth)
        }
    }
}


struct EntryView: View {
    
    @State private var showAdd = false
    @State private var showWeightAdd = false
    @State private var showGoalAdd = false
    @State private var showLegend = false
    @State private var selectedItem: EntryItem?
    @State private var selectedWeightItem: EntryItem?
    @State private var selectedGoalItem: EntryItem?
    @Environment(\.modelContext) var entryContext
    @Query(sort: \EntryItem.timestamp, order: .reverse) private var entryItems: [EntryItem]
    
    var weightCellWidth:CGFloat = UIScreen.main.bounds.width - 80
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 0){
                List {
                    Section(header: EntryHeader()) {
                        ForEach(entryItems){ eItem in
                            if (
                                eItem.iEntryTypeDiary == 1
                            ){
                             HStack(alignment: .top, spacing: 0) {
                                 Text(eItem.timestamp.formatted(.dateTime.day().month())).frame(width: cellWidthHeader, height: cellHeight).border(cellBorderColor, width: cellBorderWidth)
                                 Text("⚖️ \(eItem.iWeight)").frame(width: weightCellWidth, height: cellHeight).border(cellBorderColor, width: cellBorderWidth)
                            
                             }
                             .swipeActions{
                                 Button(role: .destructive){
                                     withAnimation{
                                         entryContext.delete(eItem)
                                     }
                                 } label: {
                                     Label("Delete",systemImage: "trash")
                                         .symbolVariant(/*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                 }
                             }
                             .swipeActions(edge: .leading){
                                 Button{
                                     selectedWeightItem = eItem
                                 } label: {
                                     Label("Edit",systemImage: "pencil")
                                 }
                                 .tint(.orange)
                             }
                             .listRowInsets(.init())
                            }
                            else if (
                                eItem.iEntryTypeDiary == 2
                            ){
                             HStack(alignment: .top, spacing: 0) {
                                 Text(eItem.timestamp.formatted(.dateTime.day().month())).frame(width: cellWidthHeader, height: cellHeight).border(cellBorderColor, width: cellBorderWidth)
                                 Text("🎯 \(eItem.iGoalMacros)").frame(width: weightCellWidth, height: cellHeight).border(cellBorderColor, width: cellBorderWidth)
                             }
                             .swipeActions{
                                 Button(role: .destructive){
                                     withAnimation{
                                         entryContext.delete(eItem)
                                     }
                                 } label: {
                                     Label("Delete",systemImage: "trash")
                                         .symbolVariant(/*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                 }
                             }
                             .swipeActions(edge: .leading){
                                 Button{
                                     selectedGoalItem = eItem
                                 } label: {
                                     Label("Edit",systemImage: "pencil")
                                 }
                                 .tint(.orange)
                             }
                             .listRowInsets(.init())
                            }
                            else {
                           
                            var macroBG: Color { switch eItem.iMacros {
                            case 1: return .red
                            case 2: return .green
                            case 3: return .yellow
                            default: return .clear
                            }}
                            var waterBG: Color { switch eItem.iWater {
                            case 1: return .red
                            case 2: return .yellow
                            case 3: return .green
                            default: return .clear
                            }}
                            var stepsBG: Color { switch eItem.iSteps {
                            case 1: return .red
                            case 2: return .yellow
                            case 3: return .green
                            default: return .clear
                            }}
                            var sleepBG: Color { switch eItem.iSleep {
                            case 1: return .red
                            case 2: return .yellow
                            case 3: return .green
                            default: return .clear
                            }}
                            var eatOutBG: Color { switch eItem.iEatOut {
                            case 1: return .green
                            case 2: return .yellow
                            case 3: return .red
                            default: return .clear
                            }}
                            var alcoholBG: Color { switch eItem.iAlcohol {
                            case 1: return .green
                            case 2: return .yellow
                            case 3: return .red
                            default: return .clear
                            }}
                            var foodQualityBG: Color { switch eItem.iFoodQuality {
                            case 1: return .red
                            case 2: return .yellow
                            case 3: return .green
                            default: return .clear
                            }}
                        
                            HStack(alignment: .top, spacing: 0) {
                                Text(eItem.timestamp.formatted(.dateTime.day().month())).frame(width: cellWidthHeader, height: cellHeight).border(cellBorderColor, width: cellBorderWidth)
                                Rectangle().fill(macroBG).frame(width: cellWidth, height: cellHeight).border(cellBorderColor, width: cellBorderWidth)
                                Rectangle().fill(waterBG).frame(width: cellWidth, height: cellHeight).border(cellBorderColor, width: cellBorderWidth)
                                Rectangle().fill(stepsBG).frame(width: cellWidth, height: cellHeight).border(cellBorderColor, width: cellBorderWidth)
                                Rectangle().fill(sleepBG).frame(width: cellWidth, height: cellHeight).border(cellBorderColor, width: cellBorderWidth)
                                Rectangle().fill(eatOutBG).frame(width: cellWidth, height: cellHeight).border(cellBorderColor, width: cellBorderWidth)
                                Rectangle().fill(alcoholBG).frame(width: cellWidth, height: cellHeight).border(cellBorderColor, width: cellBorderWidth)
                                Rectangle().fill(foodQualityBG).frame(width: cellWidth, height: cellHeight).border(cellBorderColor, width: cellBorderWidth)
                            }
                            .swipeActions{
                                Button(role: .destructive){
                                    withAnimation{
                                        entryContext.delete(eItem)
                                    }
                                } label: {
                                    Label("Delete",systemImage: "trash")
                                        .symbolVariant(/*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                }
                            }
                            .swipeActions(edge: .leading){
                                Button{
                                    selectedItem = eItem
                                } label: {
                                    Label("Edit",systemImage: "pencil")
                                }
                                .tint(.orange)
                            }
                            .listRowInsets(.init())
                            
                            } //end else statement
                        }
                      //end of for loop content
                
                        
                    }//end of section
                }// end of llist
                .listStyle(.plain)
                
                .sheet(isPresented: $showAdd, content: {
                    NavigationStack {
                        AddView()
                    }
                    .presentationDragIndicator(.visible)
                    .presentationDetents([.height(660)])
                })
                .sheet(isPresented: $showWeightAdd, content: {
                    NavigationStack {
                        AddWeightView()
                    }
                    .presentationDragIndicator(.visible)
                    .presentationDetents([.height(300)])
                })
                .sheet(isPresented: $showGoalAdd, content: {
                    NavigationStack {
                        AddGoalsView()
                    }
                    .presentationDragIndicator(.visible)
                    .presentationDetents([.height(300)])
                })
                .sheet(item: $selectedItem, content: {
                    entryItem in
                    NavigationStack {
                        UpdateView(entryItem: entryItem)
                    }
                    .presentationDragIndicator(.visible)
                    .presentationDetents([.height(660)])
                })
                
                 .sheet(item: $selectedWeightItem, content: {
                     entryItem in
                     NavigationStack {
                         UpdateWeightView(entryItem: entryItem)
                     }
                     .presentationDragIndicator(.visible)
                     .presentationDetents([.medium])
                 })
                 .sheet(item: $selectedGoalItem, content: {
                     entryItem in
                     NavigationStack {
                         UpdateGoalsView(entryItem: entryItem)
                     }
                     .presentationDragIndicator(.visible)
                     .presentationDetents([.medium])
                 })
                 
                .sheet(isPresented: $showLegend, content: {
                    VStack {
                        InfoView()
                    }
                    .presentationDragIndicator(.visible)
                    .presentationDetents([.height(540)])
                })
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            showLegend.toggle()
                        }, label: {
                            Label("Help", systemImage: "questionmark.circle")
                        })
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                                Text("Fitness 🐓").font(.headline)
                        }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack{
                            Button(action: {
                                showAdd.toggle()
                            }, label: {
                                Label("Add Entry", systemImage: "plus")
                            })
                            Button(action: {
                                showWeightAdd.toggle()
                            }, label: {
                                Label("Weight", systemImage: "scalemass")
                            })
                            Button(action: {
                                showGoalAdd.toggle()
                            }, label: {
                                Label("Goal", systemImage: "target")
                            })
                        }
                    }
                }
            } //vstack end
        }//end of navigation stack
        
    } //body end

}

#Preview {
    EntryView()
}
 
