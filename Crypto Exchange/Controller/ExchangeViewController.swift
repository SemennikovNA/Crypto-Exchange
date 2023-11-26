//
//  ExchangeViewController.swift
//  Crypto Exchange
//
//  Created by Nikita on 25.11.2023.
//

import UIKit

final class ExchangeViewController: UIViewController {
    
    //MARK: - Properties
    
    let mainView = MainScreen()
    let networkManager = ApiManager()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call function's
        setupView()
        setupConstraints()
        
        // Delegate
        mainView.cryptoCoin.delegate = self
        mainView.fiatCoin.delegate = self
        networkManager.delegate = self
    }
    
    //MARK: - Methods
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Private methods
    
    private func setupView() {
        
        // Configure view
        view.addSubviews(mainView)
        mainView.backgroundColor = .back
        
        // Configure navigation items
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "filemenu.and.selection"), style: .done, target: self, action: #selector(rightBarButtonTapped))
        rightButton.tintColor = .lightAndDarkMode
        navigationItem.rightBarButtonItem = rightButton
        
        // Targets for button
        mainView.addTarget(target: self, selector: #selector(currencyRateButtonTapped))
        mainView.cryptoCoin.clearButtonMode = .always
    }
    
    /// Configure alert controller
    private func configureAllertController(message: String, but: UIAlertAction?, isNil: Bool = false) {
        if isNil == false {
            let alert = UIAlertController(title: "Текущий курс", message: message, preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Назад", style: .cancel)
            let saveButton = UIAlertAction(title: "Сохранить", style: .default)
            alert.addAction(okButton)
            alert.addAction(saveButton)
            self.present(alert, animated: true)
        } else {
            let nilAlert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
            nilAlert.addAction(but!)
            self.present(nilAlert, animated: true)
        }
    }
    
    //MARK: - Objectiv-C methods
    
    @objc func rightBarButtonTapped() {
        let saveVC = SaveTableViewController()
        saveVC.modalTransitionStyle = .coverVertical
        saveVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(saveVC, animated: true)
    }
    
    @objc func currencyRateButtonTapped(sender: UIButton) {
        guard let crypto = mainView.cryptoCoin.text, let fiat = mainView.fiatCoin.text else { return }
        if crypto != "" || fiat != "" {
            networkManager.getCoinFiat(coin: crypto, fiat: fiat)
            mainView.cryptoCoin.text = ""
            mainView.cryptoCoin.placeholder = "Введите монету"
            mainView.fiatCoin.text = ""
            mainView.fiatCoin.placeholder = "Введите валюту"
        } else {
            let okBut = UIAlertAction(title: "Назад", style: .destructive)
            configureAllertController(message: "Введите монету и валюту", but: okBut, isNil: true)
        }
        
    }
}

//MARK: - Extension

extension ExchangeViewController {
    
    //MARK: Private extension method
    /// Setup constraints for controller
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            // Main view constraints
            mainView.topAnchor.constraint(equalTo: view.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension ExchangeViewController: UITextFieldDelegate {
    
    //MARK: Text field delegate methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            textField.endEditing(true)
            return true
        } else if textField == mainView.cryptoCoin {
            textField.placeholder = "Нужно ввести монету"
            return true
        } else {
            textField.placeholder = "Нужно ввести валюту"
            return true
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.endEditing(true)
    }
}

extension ExchangeViewController: TransitData {
    
    //MARK: Transit data delegate methods
    
    func transitData(_ apiManager: ApiManager, coins: Coins) {
        let crypto = coins.crypto
        let rate = String(format: "%.2f", coins.rate)
        let fiat = coins.fiat
        DispatchQueue.main.async {
            self.configureAllertController(message: "1 \(crypto) = \(rate) \(fiat) ", but: nil)
        }
    }
    
    func failWithError(_ error: Error) {
        print(String(describing: error))
    }
}
