//
//  RequestApi.swift
//  Beers
//
//  Created by Tatiana Rico on 07/07/21.
//  Copyright © 2021 Tatiana Rico. All rights reserved.
//

import Foundation

class RequestApi {

        // MARK: - Properties
       private let basePath: String = "https://api.punkapi.com/"
        static let configuration: URLSessionConfiguration = {
            let configuration = URLSessionConfiguration.default
            configuration.timeoutIntervalForRequest = 30
            configuration.allowsCellularAccess = true
            return configuration
        }()
        
       private let session = URLSession(configuration: configuration)
        
        // MARK: Methods
        func  requestBeer(completion: @escaping (Beer?, Bool)-> Void ) {
            guard let url = URL(string: basePath.appending("v2/beers")) else {return}
            
            let task = session.dataTask(with: url) { (data, response, error) in
                
                guard let response = response as? HTTPURLResponse else {return}
                
                guard let data = data else{return}
                if response.statusCode == 200 {
                    do{
                        let json = try JSONDecoder().decode(Beer.self, from: data)
                        DispatchQueue.main.async {
                            completion(json, true)
                        }
                    } catch {
                        completion(nil, false)
                    }
                } else {
                    completion(nil, false)
                }
            }
            task.resume()
        }
    }

