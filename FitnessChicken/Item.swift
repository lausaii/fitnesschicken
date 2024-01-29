//
//  EntryItem.swift
//  FitnessChicken
//
//  Created by Laurence Sy on 8/15/23.
//

import Foundation
import SwiftData

@Model class EntryItem {
    var timestamp: Date
    var iMacros: Int
    var iWater: Int
    var iSteps: Int
    var iSleep: Int
    var iEatOut: Int
    var iAlcohol: Int
    var iFoodQuality: Int
    var iWeight: String
    var iEntryTypeDiary: Int
    var iGoalMacros: String
    
    init(
        timestamp: Date = .now,
        iMacros: Int = 0,
        iWater: Int = 0,
        iSteps: Int = 0,
        iSleep: Int = 0,
        iEatOut: Int = 0,
        iAlcohol: Int = 0,
        iFoodQuality: Int = 0,
        iWeight: String = "",
        iEntryTypeDiary: Int = 0,
        iGoalMacros: String = ""
    
    ) {
        self.timestamp = timestamp
        self.iMacros = iMacros
        self.iWater = iWater
        self.iSteps = iSteps
        self.iSleep = iSleep
        self.iEatOut = iEatOut
        self.iAlcohol = iAlcohol
        self.iFoodQuality = iFoodQuality
        self.iWeight = iWeight
        self.iEntryTypeDiary = iEntryTypeDiary
        self.iGoalMacros = iGoalMacros
        }
}


