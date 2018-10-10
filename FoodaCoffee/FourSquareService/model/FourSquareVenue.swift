//
//  FourSquareVenue.swift
//  FoodaCoffee
//
//  Created by Noah Malmed on 10/7/18.
//  Copyright © 2018 Noah Malmed. All rights reserved.
//

import Freddy

public struct FourSquareVenue {
    let id: String
    let name: String
    let location: FourSquareLocation
}

extension FourSquareVenue: JSONDecodable {
    public init(json: JSON) throws {
        self.id = try json.getString(at: "id")
        self.name = try json.getString(at: "name")
        self.location = try json.decode(at: "location", type: FourSquareLocation.self)
    }
    
    
}
