//
//  BannerView.swift
//  Trading Calculator
//
//  Created by Вячеслав on 09.09.2023.
//

import UIKit

class BannerView: UIView {
    
    init() {
        super.init(frame: .zero)
        
        configureBannerView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureBannerView() {
        
        let bannerBackgroundColor = UIColor(red: 45/255, green: 44/255, blue: 58/255, alpha: 1)
        backgroundColor = bannerBackgroundColor

        translatesAutoresizingMaskIntoConstraints = false

        widthAnchor.constraint(equalToConstant: 350).isActive = true
        heightAnchor.constraint(equalToConstant: 200).isActive = true

        layer.cornerRadius = CGFloat(20)


        let bannerImage = UIImage(named: "banner_test")
        let bannerImageView = UIImageView(image: bannerImage)
        addSubview(bannerImageView)

        bannerImageView.translatesAutoresizingMaskIntoConstraints = false

        bannerImageView.widthAnchor.constraint(equalToConstant: 280).isActive = true
        bannerImageView.heightAnchor.constraint(equalToConstant: 160).isActive = true

        bannerImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        bannerImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
    }

}
