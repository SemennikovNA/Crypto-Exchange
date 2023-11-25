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
    }
    
    //MARK: - Private methods
    
    func setupView() {
        
        view.addSubviews(mainView)
        mainView.backgroundColor = .darkBlue
        self.navigationItem.title = "Cryptocurrency rate"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
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

#Preview {
    ExchangeViewController()
}
