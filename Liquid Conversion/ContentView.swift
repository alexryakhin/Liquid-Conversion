//
//  ContentView.swift
//  Liquid Conversion
//
//  Created by Alexander Bonney on 4/19/21.
//

import SwiftUI

struct ContentView: View {
    let measures: [UnitVolume] = [.teaspoons, .tablespoons, .fluidOunces, .cups, .pints, .quarts, .gallons, .milliliters, .liters]
    
    @State private var input = ""
    @State private var inputMeasure = 3
    @State private var outputMeasure = 7
    
    var output: Double {
        //calculation
        let inputInDouble = Double(input) ?? 0
        let inputToConvert: Measurement<UnitVolume> = Measurement(value: inputInDouble, unit: measures[inputMeasure])
        let result = inputToConvert.converted(to: measures[outputMeasure])
        let resultInDouble: Double = result.value
//        let resultInString: String = "\(resultInDouble)"
        return resultInDouble
    }

    
    var body: some View {
        NavigationView {
            Form {
                Picker("Input Measure", selection: $inputMeasure) {
                    ForEach (0..<measures.count) { measure in
                        if measure == 0 {
                            Text("Teaspoons")
                        } else if measure == 1 {
                            Text("Tablespoons")
                        } else if measure == 2 {
                            Text("Fluid Onces")
                        } else if measure == 3 {
                            Text("Cups")
                        } else if measure == 4 {
                            Text("Pints")
                        } else if measure == 5 {
                            Text("Quarts")
                        } else if measure == 6 {
                            Text("Gallons")
                        } else if measure == 7 {
                            Text("Milliliters")
                        } else if measure == 8 {
                            Text("Liters")
                        }
                    }
                }
                
                Picker("Output Measure", selection: $outputMeasure) {
                    ForEach (0..<measures.count) { measure in
                        if measure == 0 {
                            Text("Teaspoons")
                        } else if measure == 1 {
                            Text("Tablespoons")
                        } else if measure == 2 {
                            Text("Fluid Onces")
                        } else if measure == 3 {
                            Text("Cups")
                        } else if measure == 4 {
                            Text("Pints")
                        } else if measure == 5 {
                            Text("Quarts")
                        } else if measure == 6 {
                            Text("Gallons")
                        } else if measure == 7 {
                            Text("Milliliters")
                        } else if measure == 8 {
                            Text("Liters")
                        }
                    }
                }
                
                Section(header: Text("Input")) {
                    TextField("Input", text: $input).keyboardType(.decimalPad)
                }
                Section(header: Text("Output")) {
                    Text("\(output, specifier: "%.2f")")
                }
            }.navigationBarTitle("Liquid Conversion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
