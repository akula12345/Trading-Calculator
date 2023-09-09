//
//  ViewController.swift
//  Trading Calculator
//
//  Created by Вячеслав on 09.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private var calculator = Calculator()
    private var btcCell: CryptoCellStackView!
    private var ethCell: CryptoCellStackView!
    private var leverageInformationView: LeverageInformationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViewController()
    }
    
    private func setupViewController() {
        configureViewController()
        
        
        let bannerView = BannerView()
        view.addSubview(bannerView)
        bannerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        bannerView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        
        calculator = Calculator()
        calculator.randomCalculatorValues()
        
        
        btcCell = CryptoCellStackView(logoName: "btc_logo", symbol: "BTC", price: calculator.getRate())
        ethCell = CryptoCellStackView(logoName: "eth_logo", symbol: "ETH", price: Float.random(in: 2881.01...4832.51))
        
        
        let favoritesCryptoStackView = FavoritesCryptoStackView(arrangedCryptoCells: [btcCell, ethCell])
        view.addSubview(favoritesCryptoStackView)
        
        favoritesCryptoStackView.translatesAutoresizingMaskIntoConstraints = false
        favoritesCryptoStackView.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: 24).isActive = true
        favoritesCryptoStackView.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor, constant: 20).isActive = true

        
        leverageInformationView = LeverageInformationView(calculator)
        view.addSubview(leverageInformationView)
        
        leverageInformationView.translatesAutoresizingMaskIntoConstraints = false
        leverageInformationView.topAnchor.constraint(equalTo: favoritesCryptoStackView.bottomAnchor, constant: 24).isActive = true
        leverageInformationView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        

        let generateButton = UIButton()
        generateButton.setTitle("GENERATE", for: .normal)
        let colorTitle = UIColor(red: 148/255, green: 129/255, blue: 96/255, alpha: 1)
        generateButton.setTitleColor(colorTitle, for: .normal)
        generateButton.backgroundColor = UIColor(red: 110/255, green: 95/255, blue: 76/255, alpha: 1)
        generateButton.layer.cornerRadius = 10
        generateButton.addTarget(self, action: #selector(generateAction), for: .touchUpInside)
        view.addSubview(generateButton)
        
        generateButton.translatesAutoresizingMaskIntoConstraints = false
        generateButton.widthAnchor.constraint(equalToConstant: 175).isActive = true
        generateButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        generateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -48).isActive = true
        generateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func configureViewController() {
        
        let backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 37/255, alpha: 1)
        view.backgroundColor = backgroundColor
        
        overrideUserInterfaceStyle = .dark

    }
    
    private func updateValues() {
        btcCell.setPrice(calculator.getRate())
        ethCell.setPrice(calculator.getRate())
        leverageInformationView.setPrice(calculator.getRate())
    }
    
    @objc func generateAction(sender: UIButton) {
        calculator.randomCalculatorValues()
        updateValues()
    }

}

