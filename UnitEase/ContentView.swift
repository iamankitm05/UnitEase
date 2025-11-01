//
//  ContentView.swift
//  UnitEase
//
//  Created by Ankit Kumar Ojha on 29/10/25.
//

import SwiftUI

struct UnitType: Hashable {
    let name: String
    let unit: String
    let conversion: Double
    
    init(_ name: String, _ unit: String, _ conversion: Double) {
        self.name = name
        self.unit = unit
        self.conversion = conversion
    }
}

struct ContentView: View {
    @State private var inputUnitType: UnitType = UnitType("Meters", "m", 1.0)
    @State private var outputUnitType: UnitType = UnitType("Kilometers", "km", 1000)
    
    @State private var inputValue: Double = 0.0
    
    var outputValue: Double {
        inputValue * inputUnitType.conversion / outputUnitType.conversion
    }
    
    let lengths = [
        UnitType("Meters", "m", 1.0),
        UnitType("Kilometers", "km", 1000),
        UnitType("Feet", "ft", 0.3048),
        UnitType("Yards", "yd", 0.9144),
        UnitType("Miles", "mi", 1609.34)
    ]
    
    
    var body: some View {
        NavigationStack {
            Form {
              
                Section("Please select the type of input unit.") {
                    Picker("Input Unit Type", selection: $inputUnitType) {
                        ForEach(lengths, id: \.self) { unit in
                            Text(unit.name)
                                .tag(unit)
                        }
                    }.pickerStyle(.segmented)
                }
                
                Section("Please select the type of output unit.") {
                    Picker("Output Unit Type", selection: $outputUnitType) {
                        ForEach(lengths, id: \.self) { unit in
                            Text(unit.name)
                                .tag(unit)
                        }
                    }.pickerStyle(.segmented)
                }
                
                Section("Input Value") {
                    TextField("Input Value", value: $inputValue, format: .number)
                }
                
                Section("Result (in \(outputUnitType.unit))") {
                    Text(outputValue, format: .number)
                }
                

            }.navigationTitle("UnitEase")
        }
    }
}

#Preview {
    ContentView()
}
