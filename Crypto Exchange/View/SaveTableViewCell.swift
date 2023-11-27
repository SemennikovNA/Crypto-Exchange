//
//  SaveTableViewCell.swift
//  Crypto Exchange
//
//  Created by Nikita on 26.11.2023.
//

import UIKit

final class SaveTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    let identifire = "SaveCell"
    let cryptoLabel = UILabel()
    let equalLabel = UILabel()
    let fiatLabel = UILabel()
    
    //MARK: - Initialize
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews(
            self.cryptoLabel,
            self.equalLabel,
            self.fiatLabel
        )
        NSLayoutConstraint.activate([
            
            // Crypto label
            cryptoLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            cryptoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            
            // Equal label
            equalLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            equalLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            // Fiat label
            fiatLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            fiatLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
