//
//  ShopSearchFetcher.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/13.
//

import Foundation

class ShopSearchFetcher {
    var requestString = String()
    
    // API叩く
    func fetchShopData(completion: @escaping ([Shop]) -> Void) {
        // force unwrap! 使いたくないのでguard
        guard let requestUrl = URL(string: requestString) else {
            return
        }
        print("requestURL: \(requestUrl)")
        
        URLSession.shared.dataTask(with: URLRequest(url: requestUrl)) { (data, response, error) in
            guard let data = data else {
                return
            }
            
            let decoder: JSONDecoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let searchResponseData = try decoder.decode(HotPepperResponse.self, from: data)
                print("JSONDecode succeeded.")
                
                DispatchQueue.main.async {
                    completion(searchResponseData.results.shop)
                }
            } catch {
                print("JSONDecode Failure Overview.: \(error.localizedDescription)")
                print("Details of JSONDecode failure.: \(error)")
            }
        }.resume() // URLSessionタスク開始
        
    }
}
