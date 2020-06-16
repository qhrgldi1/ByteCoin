//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateCoin(_ coinManager: CoinManager, _ coin: CoinModel)
    func didFailWithError(_ error: Error)
}

struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "8553EB1B-7067-4A37-9D64-8245ACA4D174"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        performRequest(urlString)
    }
    
    func performRequest(_ urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error!)
                    return
                }
                
                guard let safeData = data else { return }
                let coin = self.parseJSON(safeData)
                self.delegate?.didUpdateCoin(self, coin!)
            }
            
            task.resume()
        }
    }
    
    func parseJSON(_ safeData: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do {
            let jsonData = try decoder.decode(CoinData.self, from: safeData)
            let money = jsonData.asset_id_quote
            let rate = jsonData.rate
            
            let coin = CoinModel(currencyName: money, currentRate: rate)
            return coin
            
        } catch let jsonErr {
            print("something wrong after downloaded: \(jsonErr)")
            return nil
        }
    }
}
