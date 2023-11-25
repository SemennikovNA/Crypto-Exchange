//
//  MainScreen.swift
//  Crypto Exchange
//
//  Created by Nikita on 25.11.2023.
//

import UIKit

final class MainScreen: UIView {
    
    let currencyLabel: UILabel = {
        let lbl = UILabel()
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubviews(currencyLabel)
    }
    
    
}
