//
//  UIView - Extension.swift
//  Crypto Exchange
//
//  Created by Nikita on 25.11.2023.
//

import UIKit

extension UIView {
    
    //MARK: - Methods
    
    func addSubviews(_ view: UIView...) {
        
        view.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(view)
        }
    }
    
    func makeShadow() {
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOpacity = 0.25
        self.layer.shadowOffset = CGSize(width: -1, height: 3)
        self.layer.shadowRadius = 4
    }
    
}
