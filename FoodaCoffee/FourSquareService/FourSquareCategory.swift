//
//  FourSquareCategories.swift
//  FoodaCoffee
//
//  Created by Noah Malmed on 10/6/18.
//  Copyright © 2018 Noah Malmed. All rights reserved.
//

enum FourSquareCategory {
    case coffeeShop
}

extension FourSquareCategory {
    var id: String {
        switch self {
            case .coffeeShop:
                return "4bf58dd8d48988d1e0931735"
        }
    }
}
