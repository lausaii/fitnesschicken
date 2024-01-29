//
//  Legend View.swift
//  FitnessChicken
//
//  Created by Laurence Sy on 8/23/23.
//

import SwiftUI


struct LegendView: View {
    var cellWidthHeaderLegend:CGFloat = 80
    var cellWidthLegend:CGFloat = (UIScreen.main.bounds.width - 80)/3
    var cellHeightHeaderLegend:CGFloat = 40
    var cellHeightLegend:CGFloat = 60
    var cellBorderWidthLegend:CGFloat = 0
    @State private var legendBorderColor: Color = Color.white
    @State private var legendGreenColor: Color = Color.green
    @State private var legendYellowColorLight: Color = Color(red: 0.8549, green: 0.6471, blue: 0.1255)
    @State private var legendRedColor: Color = Color.red
    @State private var legendYellowColor: Color = Color(red: 0.9481, green: 0.8824, blue: 0.1882)
    @Environment(\.colorScheme) var colorScheme
    

    var body: some View {
        VStack{
            List{
                VStack(alignment: .leading, spacing: 0){
                    HStack(alignment: .top, spacing: 0) {
                        Text(" ").fixedSize().frame(width: cellWidthHeaderLegend, height: cellHeightHeaderLegend).border(legendBorderColor, width: cellBorderWidthLegend)
                        Text("🟢").fixedSize().frame(width: cellWidthLegend, height: cellHeightHeaderLegend).border(legendBorderColor, width: cellBorderWidthLegend)
                        Text("🟡").fixedSize().frame(width: cellWidthLegend, height: cellHeightHeaderLegend).border(legendBorderColor, width: cellBorderWidthLegend)
                        Text("🔴").fixedSize().frame(width: cellWidthLegend, height: cellHeightHeaderLegend).border(legendBorderColor, width: cellBorderWidthLegend)
                    }
                    HStack(alignment: .top, spacing: 0) {
                        Text("Macros").bold().fixedSize().frame(width: cellWidthHeaderLegend, height: cellHeightLegend).border(legendBorderColor, width: cellBorderWidthLegend)
                        Text("At Goal").fixedSize().frame(width: cellWidthLegend, height: cellHeightLegend).border(legendBorderColor, width: cellBorderWidthLegend).foregroundStyle(legendGreenColor)
                        Text("Over Goal").fixedSize().frame(width: cellWidthLegend, height: cellHeightLegend).border(legendBorderColor, width: cellBorderWidthLegend).foregroundStyle(colorScheme == .dark ? legendYellowColor : legendYellowColorLight)
                        Text("Under Goal").fixedSize().frame(width: cellWidthLegend, height: cellHeightLegend).border(legendBorderColor, width: cellBorderWidthLegend).foregroundStyle(legendRedColor)
                    }
                    HStack(alignment: .top, spacing: 0) {
                        Text("Water").bold().fixedSize().frame(width: cellWidthHeaderLegend, height: cellHeightLegend).border(legendBorderColor, width: cellBorderWidthLegend)
                        Text("100+ Oz").fixedSize().frame(width: cellWidthLegend, height: cellHeightLegend).border(legendBorderColor, width: cellBorderWidthLegend).foregroundStyle(legendGreenColor)
                        Text("70-100 Oz").fixedSize().frame(width: cellWidthLegend, height: cellHeightLegend).border(legendBorderColor, width: cellBorderWidthLegend).foregroundStyle(colorScheme == .dark ? legendYellowColor : legendYellowColorLight)
                        Text("<70 Oz").fixedSize().frame(width: cellWidthLegend, height: cellHeightLegend).border(legendBorderColor, width: cellBorderWidthLegend).foregroundStyle(legendRedColor)
                    }
                    HStack(alignment: .top, spacing: 0) {
                        Text("Steps").bold().fixedSize().frame(width: cellWidthHeaderLegend, height: cellHeightLegend).border(legendBorderColor, width: cellBorderWidthLegend)
                        Text("10K+").fixedSize().frame(width: cellWidthLegend, height: cellHeightLegend).border(legendBorderColor, width: cellBorderWidthLegend).foregroundStyle(legendGreenColor)
                        Text("7-10K").fixedSize().frame(width: cellWidthLegend, height: cellHeightLegend).border(legendBorderColor, width: cellBorderWidthLegend).foregroundStyle(colorScheme == .dark ? legendYellowColor : legendYellowColorLight)
                        Text("<7K").fixedSize().frame(width: cellWidthLegend, height: cellHeightLegend).border(legendBorderColor, width: cellBorderWidthLegend).foregroundStyle(legendRedColor)
                    }
                    HStack(alignment: .top, spacing: 0) {
                        Text("Sleep").bold().fixedSize().frame(width: cellWidthHeaderLegend, height: cellHeightLegend).border(legendBorderColor, width: cellBorderWidthLegend)
                        Text("8+ Hrs").fixedSize().frame(width: cellWidthLegend, height: cellHeightLegend).border(legendBorderColor, width: cellBorderWidthLegend).foregroundStyle(legendGreenColor)
                        Text("6-8 Hrs").fixedSize().frame(width: cellWidthLegend, height: cellHeightLegend).border(legendBorderColor, width: cellBorderWidthLegend).foregroundStyle(colorScheme == .dark ? legendYellowColor : legendYellowColorLight)
                        Text("<6 Hrs").fixedSize().frame(width: cellWidthLegend, height: cellHeightLegend).border(legendBorderColor, width: cellBorderWidthLegend).foregroundStyle(legendRedColor)
                    }
                    HStack(alignment: .top, spacing: 0) {
                        Text("Eat Out").bold().fixedSize().frame(width: cellWidthHeaderLegend, height: cellHeightLegend).border(legendBorderColor, width: cellBorderWidthLegend)
                        Text("0").fixedSize().frame(width: cellWidthLegend, height: cellHeightLegend).border(legendBorderColor, width: cellBorderWidthLegend).foregroundStyle(legendGreenColor)
                        Text("1-2").fixedSize().frame(width: cellWidthLegend, height: cellHeightLegend).border(legendBorderColor, width: cellBorderWidthLegend).foregroundStyle(colorScheme == .dark ? legendYellowColor : legendYellowColorLight)
                        Text("3+").fixedSize().frame(width: cellWidthLegend, height: cellHeightLegend).border(legendBorderColor, width: cellBorderWidthLegend).foregroundStyle(legendRedColor)
                    }
                    HStack(alignment: .top, spacing: 0) {
                        Text("Alcohol").bold().fixedSize().frame(width: cellWidthHeaderLegend, height: cellHeightLegend).border(legendBorderColor, width: cellBorderWidthLegend)
                        Text("0").fixedSize().frame(width: cellWidthLegend, height: cellHeightLegend).border(legendBorderColor, width: cellBorderWidthLegend).foregroundStyle(legendGreenColor)
                        Text("1-2").fixedSize().frame(width: cellWidthLegend, height: cellHeightLegend).border(legendBorderColor, width: cellBorderWidthLegend).foregroundStyle(colorScheme == .dark ? legendYellowColor : legendYellowColorLight)
                        Text("3+").fixedSize().frame(width: cellWidthLegend, height: cellHeightLegend).border(legendBorderColor, width: cellBorderWidthLegend).foregroundStyle(legendRedColor)
                    }
                    HStack(alignment: .top, spacing: 0) {
                        Text("Food Quality").bold().fixedSize(horizontal: false, vertical: true).frame(width: cellWidthHeaderLegend, height: cellHeightLegend).border(legendBorderColor, width: cellBorderWidthLegend)
                        Text("Optimal").fixedSize().frame(width: cellWidthLegend, height: cellHeightLegend).border(legendBorderColor, width: cellBorderWidthLegend).foregroundStyle(legendGreenColor)
                        Text("Balanced").fixedSize().frame(width: cellWidthLegend, height: cellHeightLegend).border(legendBorderColor, width: cellBorderWidthLegend).foregroundStyle(colorScheme == .dark ? legendYellowColor : legendYellowColorLight)
                        Text("Poor").fixedSize().frame(width: cellWidthLegend, height: cellHeightLegend).border(legendBorderColor, width: cellBorderWidthLegend).foregroundStyle(legendRedColor)
                    }
                }
            }.listStyle(.plain)
        }
        .navigationTitle("Table Colors Legend")
        .navigationBarTitleDisplayMode(.inline)
    }
}
 


