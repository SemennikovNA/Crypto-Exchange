//
//  ApiManager.swift
//  Crypto Exchange
//
//  Created by Nikita on 26.11.2023.
//

import UIKit

protocol TransitData {
    func transitData(_ apiManager: ApiManager, coins: Coins)
    func failWithError(_ error: Error)
}

class ApiManager {
    
    //MARK: - Properties
    
    let apiKey = "8151B4C9-D0CA-4883-81BE-10452B7393C1"
    let url = "https://rest.coinapi.io/v1/exchangerate/"
    var delegate: TransitData?
    
    //MARK: - Methods
    
    func getCoinFiat(coin: String, fiat: String) {
        let urlString = "\(url)apikey-\(apiKey)/\(coin)/\(fiat)"
        getCurrency(url: urlString)
    }
    
    func getCurrency(url: String) {
        guard let urlString = URL(string: url) else { return }
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: urlString) { data, response, error in
            if error != nil {
                print(String(describing: error))
            }
            guard let parseData = try? JSONDecoder().decode(Coinapi.self, from: data!) else { return }
            let coin = Coins(crypto: parseData.asset_id_base, fiat: parseData.asset_id_quote, rate: parseData.rate)
            self.delegate?.transitData(self, coins: coin)
        }
        task.resume()
    }
}
