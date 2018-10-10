//
//  CoffeeShopClient.swift
//  FoodaCoffee
//
//  Created by Noah Malmed on 10/6/18.
//  Copyright © 2018 Noah Malmed. All rights reserved.
//

import Freddy
import CoreLocation

class FourSquareClient {
    
    // These should be store in the Plist
    let CLIENT_ID = "WQYKKM1H5GIJB3FROHNVAB24NB10II5UPTKBQ1EOUV0THSSL"
    let CLIENT_SECRET = "FZFIQFXZ4HETXOLBXEJIUDEA0AO2THTEUSHB13PIIMJK3QBR"
    let API_VERSION = "20180901"
    
    let urlSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    weak var delegate: FourSquareClientDelegate?
    
    func getLocationsFor(category: FourSquareCategory,  forLattitude lattitude: Double, longitude: Double) {
        var queryUrl = URLComponents(string: "https://api.foursquare.com/v2/venues/search")
        let llString = "\(lattitude),\(longitude)"
        queryUrl?.queryItems = [
            URLQueryItem(name: "client_id", value: self.CLIENT_ID),
            URLQueryItem(name: "client_secret", value: self.CLIENT_SECRET),
            URLQueryItem(name: "v", value: self.API_VERSION),
            URLQueryItem(name: "ll", value: llString),
            URLQueryItem(name: "categoryId", value: category.id)
        ]
        
        guard let url = queryUrl?.url else {
            // fail here
            return
        }
        
        self.dataTask?.cancel()
        self.dataTask = self.urlSession.dataTask(with: url) { data, response, error in
                guard let data = data, let json = try? JSON(data: data) else {
                    self.delegate?.client(self, didFailWith: "Error Parsing JSON")
                    return
                }
            
            do {
                let response = try json.decode(at: "response", type: FourSquareResponse.self)
                self.delegate?.client(self, didGet: response.venues, in: category)
            } catch {
                self.delegate?.client(self, didFailWith: error.localizedDescription)
            }
        }
        self.dataTask?.resume()
    }
    
}

protocol FourSquareClientDelegate: class {
    func client(_ client: FourSquareClient, didGet venues: [FourSquareVenue], in category: FourSquareCategory)
    
    func client(_ client: FourSquareClient, didFailWith error: String)
}
