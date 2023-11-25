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
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call function's
        setupView()
        setupConstraints()
        
        // Delegate
        mainView.cryptoCoin.delegate = self
        mainView.fiatCoin.delegate = self
    }
    
    //MARK: - Methods
    
    
    
    //MARK: - Private methods
    
    private func setupView() {
        
        // Configure view
        view.addSubviews(mainView)
        mainView.backgroundColor = .darkBlue
        
        // Configure navigation items
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "filemenu.and.selection"), style: .done, target: self, action: #selector(rightBarButtonTapped))
        rightButton.tintColor = .lightAndDarkMode
        navigationItem.rightBarButtonItem = rightButton
        
        // Targets for button
        mainView.addTarget(target: self, selector: #selector(currencyRateButtonTapped))
    }
    
    private func configureAllertController(message: String) {
        let alert = UIAlertController(title: "Текущий курс", message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Назад", style: .cancel)
        let saveButton = UIAlertAction(title: "Сохранить", style: .default)
        alert.addAction(okButton)
        alert.addAction(saveButton)
        self.present(alert, animated: true)
    }
    
    //MARK: - Objectiv-C methods
    
    @objc func rightBarButtonTapped() {
        // Переход на контроллер сохранения
    }
    
    @objc func currencyRateButtonTapped() {
        configureAllertController(message: "Hello")
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
    
    
}
#Preview {
    ExchangeViewController()
}
