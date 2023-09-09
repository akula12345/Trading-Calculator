//
//  LeverageInformationView.swift
//  Trading Calculator
//
//  Created by Вячеслав on 11.09.2023.
//

import UIKit

class LeverageInformationView: UIView {
    private var calculator: Calculator!
    private var leverageLabel: UILabel!
    private var descriptionTextView: UITextView!
    private var price: Float! {
        didSet {
            leverageLabel.text = "x\(Int(calculator.calculateLeverage()))"
            descriptionTextView.text = """
                                    Your leverage: x\(calculator.calculateLeverage())
                                    Rate: \(calculator.getRate())
                                    Your stop loss: \(calculator.getStopLoss())
                                    Your maximum loss percent: \(calculator.getMaxLossPercent())%
                                    """
        }
    }

    init(_ calculator: Calculator) {
        super.init(frame: .zero)
        
        self.calculator = calculator
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        leverageLabel = UILabel()
        leverageLabel.textColor = UIColor(red: 195/255, green: 182/255, blue: 128/255, alpha: 1)
        leverageLabel.text = "x\(Int(calculator.calculateLeverage()))"
        leverageLabel.font = .boldSystemFont(ofSize: 32)
        addSubview(leverageLabel)
        
        leverageLabel.translatesAutoresizingMaskIntoConstraints = false
        leverageLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        leverageLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        let bandView = UIView()
        bandView.backgroundColor = UIColor(red: 93/255, green: 91/255, blue: 120/255, alpha: 1)
        addSubview(bandView)
        bandView.translatesAutoresizingMaskIntoConstraints = false
        bandView.widthAnchor.constraint(equalToConstant: 350).isActive = true
        bandView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        bandView.topAnchor.constraint(equalTo: leverageLabel.bottomAnchor, constant: 10).isActive = true
        bandView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        descriptionTextView = UITextView()
        descriptionTextView.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 37/255, alpha: 1)
        descriptionTextView.textColor = UIColor(red: 93/255, green: 91/255, blue: 120/255, alpha: 1)
        descriptionTextView.font = .boldSystemFont(ofSize: 16)
        descriptionTextView.text = """
                                Your leverage: x\(calculator.calculateLeverage())
                                Rate: \(calculator.getRate())
                                Your stop loss: \(calculator.getStopLoss())
                                Your maximum loss percent: \(calculator.getMaxLossPercent())%
                                """
        addSubview(descriptionTextView)
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.widthAnchor.constraint(equalToConstant: 350).isActive = true
        descriptionTextView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        descriptionTextView.topAnchor.constraint(equalTo: bandView.bottomAnchor, constant: 10).isActive = true
        descriptionTextView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    func setPrice(_ newPrice: Float) {
        price = newPrice
    }
}
