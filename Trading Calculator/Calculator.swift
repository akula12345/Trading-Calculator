//
//  Calculator.swift
//  Trading Calculator
//
//  Created by Вячеслав on 10.09.2023.
//

import Foundation

class Calculator {
    private var rate: Float = 0
    private var stopLoss: Float = 0
    private var maxLossPercent: Float = 0
    
    init() {
    }
    
    init(rate: Float, stopLoss: Float, maxLossPercent: Float) {
        self.rate = rate
        self.stopLoss = stopLoss
        self.maxLossPercent = maxLossPercent
    }
    
    /// Sets calculator values
    func setValues(rate: Float, stopLoss: Float, maxLossPercent: Float) {
        self.rate = rate
        self.stopLoss = rate
        self.maxLossPercent = maxLossPercent
    }
    
    ///  Returns leverage
    func calculateLeverage() -> Float {
        let oneProcent = rate * 0.01
        let difference = rate - stopLoss
        let resultProcent = Float(difference) / oneProcent
        
        let maximumLossValue = maxLossPercent * oneProcent
        
        guard resultProcent < maxLossPercent else {
            return 1
        }
        
        return maximumLossValue / difference
    }
    
    /// Returns currency rate
    func getRate() -> Float {
        return rate
    }
    
    /// Returns stop loss
    func getStopLoss() -> Float {
        return stopLoss
    }
    
    /// Returns maximum stop loss
    func getMaxLossPercent() -> Float {
        return maxLossPercent
    }
    
    /// Changes the calculator values to random values
    func randomCalculatorValues() {
        rate = Float.random(in: 28000.01...32000.545)
        stopLoss = getRate() * Float.random(in: 0.20...0.90)
        maxLossPercent = Float.random(in: 20...80)
    }
}
