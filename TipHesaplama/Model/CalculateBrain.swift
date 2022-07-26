//
//  CalculateBrain.swift
//  TipHesaplama
//
//  Created by Barış Yeşilkaya on 26.07.2022.
//

import Foundation

struct CalculateBrain {
    
    var tip = 0.10
    var numberOfPeople = 2
    var bill = 0.0
    var result = "0.0"
    
    mutating func calculateResult(bill: Double, split: Int) {
        if bill != 0 {
            let tipValue = bill * tip
            let totalBill = bill + tipValue
            let resultDouble = totalBill/Double(numberOfPeople)
            result = String(format: "%.2f", resultDouble)
            numberOfPeople = split
        }
    }
    mutating func calculateTip(tip: Double) {
        self.tip = tip * 100
    }
    
}
