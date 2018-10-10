//
//  FourSquareLocation.swift
//  FoodaCoffee
//
//  Created by Noah Malmed on 10/7/18.
//  Copyright © 2018 Noah Malmed. All rights reserved.
//

import Freddy
import CoreLocation

public struct FourSquareLocation {
    let address: String
    let lat: Double
    let lng: Double
    let labeledLatLngs: [LabeledLatLongs]?
    let distance: Int
    let postalCode: String? 
    let cc: String
    let city: String
    let state: String
    let country: String
    let formattedAddress: [String]
    
    var location: CLLocation {
        return CLLocation(latitude: self.lat, longitude: self.lng)
    }
}

extension FourSquareLocation: JSONDecodable {
    public init(json value: JSON) throws {
        self.address = try value.getString(at: "address")
        self.lat = try value.getDouble(at: "lat")
        self.lng = try value.getDouble(at: "lng")
        self.labeledLatLngs = try? value.getArray(at: "labeledLatLngs").map(LabeledLatLongs.init)
        self.distance = try value.getInt(at: "distance")
        self.postalCode = try? value.getString(at: "postalCode")
        self.cc = try value.getString(at: "cc")
        self.city = try value.getString(at: "city")
        self.state = try value.getString(at: "state")
        self.country = try value.getString(at: "country")
        self.formattedAddress = try value.decodedArray(at: "formattedAddress", type: String.self)
    }
}

public struct LabeledLatLongs {
    let label: String
    let lat: Double
    let lng: Double
}

extension LabeledLatLongs: JSONDecodable {
    public init(json value: JSON) throws {
        self.label = try value.getString(at: "label")
        self.lat = try value.getDouble(at: "lat")
        self.lng = try value.getDouble(at: "lng")
    }
}

//extension Person: JSONDecodable {
//    public init(json value: JSON) throws {
//        name = try value.getString(at: "name")
//        age = try value.getInt(at: "age")
//        spouse = try value.getBool(at: "spouse")
//    }
//}
