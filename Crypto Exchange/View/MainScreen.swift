//
//  MainScreen.swift
//  Crypto Exchange
//
//  Created by Nikita on 25.11.2023.
//

import UIKit

final class MainScreen: UIView {
    
    //MARK: - UI Elements
    
   private lazy var headImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "bit")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var currencyLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Курс монет"
        lbl.textAlignment = .center
        lbl.textColor = .lightAndDarkMode
        lbl.font = .boldSystemFont(ofSize: 35)
        return lbl
    }()
    
    let cryptoCoin: UITextField = {
        let crypto = UITextField()
        crypto.backgroundColor = .white
        crypto.makeShadow()
        crypto.font = .systemFont(ofSize: 25)
        crypto.textAlignment = .center
        crypto.textColor = .black
        crypto.tintColor = .black
        crypto.layer.cornerRadius = 30
        crypto.clearButtonMode = .always
        crypto.keyboardType = .webSearch
        crypto.autocapitalizationType = .allCharacters
        crypto.attributedPlaceholder = NSAttributedString(
            string: "Введите монету",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        return crypto
    }()
    
    let fiatCoin: UITextField = {
        let fiat = UITextField()
        fiat.backgroundColor = .white
        fiat.makeShadow()
        fiat.font = .systemFont(ofSize: 25)
        fiat.textAlignment = .center
        fiat.textColor = .black
        fiat.tintColor = .black
        fiat.layer.cornerRadius = 30
        fiat.clearButtonMode = .always
        fiat.keyboardType = .webSearch
        fiat.autocapitalizationType = .allCharacters
        fiat.attributedPlaceholder = NSAttributedString(
            string: "Введите валюту",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        return fiat
    }()
    
    private lazy var currencyRateButton: UIButton = {
        let but = UIButton()
        but.backgroundColor = .white
        but.layer.cornerRadius = 25
        but.isSelected = true
        but.makeShadow()
        return but
    }()
    
    //MARK: - Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Call function's
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    func addTarget(target: Any, selector: Selector) {
        currencyRateButton.addTarget(target, action: selector, for: .touchUpInside)
    }
    
    //MARK: - Private methods
    
    private func setupView() {
        self.addSubviews(
            headImage,
            cryptoCoin,
            currencyLabel,
            fiatCoin,
            currencyRateButton
        )
        currencyRateButton.setTitle("Посчитать", for: .normal)
        currencyRateButton.setTitleColor(.black, for: .normal)
        currencyRateButton.titleLabel?.font = .systemFont(ofSize: 25)
    }
}

//MARK: - Extension

extension MainScreen {
    
    private func setupConstraints()  {
        
        NSLayoutConstraint.activate([
            
            // Currency label
            currencyLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            currencyLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            currencyLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            currencyLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            currencyLabel.heightAnchor.constraint(equalToConstant: 100),
            
            // Head image view
            headImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            headImage.topAnchor.constraint(equalTo: currencyLabel.bottomAnchor),
            headImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            headImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            headImage.heightAnchor.constraint(equalToConstant: 100),
            
            // Crypto coin text field
            cryptoCoin.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            cryptoCoin.topAnchor.constraint(equalTo: self.headImage.bottomAnchor, constant: 50),
            cryptoCoin.heightAnchor.constraint(equalToConstant: 60),
            cryptoCoin.widthAnchor.constraint(equalToConstant: 300),
            
            // Fiat coint text field
            fiatCoin.topAnchor.constraint(equalTo: cryptoCoin.bottomAnchor, constant: 50),
            fiatCoin.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            fiatCoin.heightAnchor.constraint(equalToConstant: 60),
            fiatCoin.widthAnchor.constraint(equalToConstant: 300),
            
            // Currency rate button
            currencyRateButton.topAnchor.constraint(equalTo: fiatCoin.bottomAnchor, constant: 200),
            currencyRateButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            currencyRateButton.heightAnchor.constraint(equalToConstant: 50),
            currencyRateButton.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
}
