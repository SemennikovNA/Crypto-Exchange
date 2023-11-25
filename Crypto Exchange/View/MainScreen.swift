//
//  MainScreen.swift
//  Crypto Exchange
//
//  Created by Nikita on 25.11.2023.
//

import UIKit

final class MainScreen: UIView {
    
    //MARK: - UI Elements
    
    let cryptoCoin: UITextField = {
        let crypto = UITextField()
        crypto.backgroundColor = .white
        crypto.makeShadow()
        crypto.font = .systemFont(ofSize: 25)
        crypto.placeholder = "Введите монету"
        return crypto
    }()
    
    let currencyLabel: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .white
        lbl.text = "Testtesttest"
        lbl.textAlignment = .center
        lbl.font = .boldSystemFont(ofSize: 35)
        return lbl
    }()
    
    let fiatCoin: UITextField = {
        let fiat = UITextField()
        fiat.backgroundColor = .white
        fiat.makeShadow()
        fiat.font = .systemFont(ofSize: 25)
        fiat.placeholder = "Введите фиатную валюту"
        return fiat
    }()
    
    let currencyRate: UIButton = {
        let but = UIButton()
        but.backgroundColor = .white
        but.makeShadow()
        return but
    }()
    
    //MARK: - Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Call function's
        setupView()
        setupConstraints()
        
        cryptoCoin.layer.cornerRadius = cryptoCoin.frame.height / 2
        fiatCoin.layer.cornerRadius = fiatCoin.frame.height / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private methods
    
    private func setupView() {
        self.addSubviews(
            cryptoCoin,
            currencyLabel,
            fiatCoin,
            currencyRate
        )
    }
}

//MARK: - Extension

extension MainScreen {
    
    private func setupConstraints()  {
        
        NSLayoutConstraint.activate([
            
            // Crypto coin text field
            cryptoCoin.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            cryptoCoin.bottomAnchor.constraint(equalTo: self.currencyLabel.topAnchor, constant: -50),
            cryptoCoin.heightAnchor.constraint(equalToConstant: 60),
            cryptoCoin.widthAnchor.constraint(equalToConstant: 300),
            
            // Currency label
            currencyLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            currencyLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            currencyLabel.heightAnchor.constraint(equalToConstant: 60),
            currencyLabel.widthAnchor.constraint(equalToConstant: 300),
            
            // Fiat coint text field
            fiatCoin.topAnchor.constraint(equalTo: currencyLabel.bottomAnchor, constant: 50),
            fiatCoin.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            fiatCoin.heightAnchor.constraint(equalToConstant: 60),
            fiatCoin.widthAnchor.constraint(equalToConstant: 300),
            
            // Currency rate button
            currencyRate.topAnchor.constraint(equalTo: fiatCoin.bottomAnchor, constant: 150),
            currencyRate.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            currencyRate.heightAnchor.constraint(equalToConstant: 50),
            currencyRate.widthAnchor.constraint(equalToConstant: 150),
        ])
    }
}
