//
//  FourSquareResponse.swift
//  FoodaCoffee
//
//  Created by Noah Malmed on 10/7/18.
//  Copyright © 2018 Noah Malmed. All rights reserved.
//

import Freddy

struct FourSquareResponse {
    let venues: [FourSquareVenue]
}

extension FourSquareResponse: JSONDecodable {
    init(json: JSON) throws {
        self.venues = try json.getArray(at: "venues").map(FourSquareVenue.init)
    }
    
    
}
