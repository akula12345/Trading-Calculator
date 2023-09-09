//
//  favoritesCryptoStackView.swift
//  Trading Calculator
//
//  Created by Вячеслав on 10.09.2023.
//

import UIKit

class FavoritesCryptoStackView: UIStackView {

    init(arrangedCryptoCells: [CryptoCellStackView]) {
        super.init(frame: .zero)
        
        configureFavoritesCrypto(arrangedCryptoCells)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureFavoritesCrypto(_ arrangedCryptoCells: [CryptoCellStackView]) {
        axis = .horizontal
        distribution = .fillEqually
        
        arrangedCryptoCells.forEach{ cryptoCell in
            addArrangedSubview(cryptoCell)
        }

        translatesAutoresizingMaskIntoConstraints = false
        
        widthAnchor.constraint(equalToConstant: 350).isActive = true
        heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
}
