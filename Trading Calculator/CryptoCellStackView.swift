//
//  CryptoCellStackView.swift
//  Trading Calculator
//
//  Created by Вячеслав on 10.09.2023.
//

import UIKit

class CryptoCellStackView: UIStackView {
    
    private var priceLabel: UILabel!
    private var price: Float = 0 {
        didSet {
            priceLabel.text = "\(price)"
        }
    }

    init(logoName: String, symbol: String, price: Float) {
        super.init(frame: .zero)
        self.price = price
        configureCryptoCell(logoName: logoName, symbol: symbol, price: price)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCryptoCell(logoName: String, symbol: String, price: Float) {
        let logo = UIImage(named: logoName)
        let logoImageView = UIImageView(image: logo)

        logoImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true

        let cryptoPriceStackView = UIStackView()
        cryptoPriceStackView.axis = .vertical
    
        let symbolLabel = UILabel()
        symbolLabel.text = symbol
        symbolLabel.font = .boldSystemFont(ofSize: 16.0)
        
        priceLabel = UILabel()
        priceLabel.text = "\(price)"
        priceLabel.font = .boldSystemFont(ofSize: 14.0)
        
        cryptoPriceStackView.addArrangedSubview(symbolLabel)
        cryptoPriceStackView.addArrangedSubview(priceLabel)
        
        let cryptoTextColor = UIColor(red: 93/255, green: 91/255, blue: 120/255, alpha: 1)
        symbolLabel.textColor = cryptoTextColor
        priceLabel.textColor = cryptoTextColor
        
        let favoriteCryptoCell = UIStackView()
        favoriteCryptoCell.axis = .horizontal
        favoriteCryptoCell.spacing = 8
        favoriteCryptoCell.addArrangedSubview(logoImageView)
        favoriteCryptoCell.addArrangedSubview(cryptoPriceStackView)
        addSubview(favoriteCryptoCell)
        
        favoriteCryptoCell.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func getPrice() -> Float {
        return price
    }
    
    func setPrice(_ newPrice: Float) {
        price = newPrice
    }
}
