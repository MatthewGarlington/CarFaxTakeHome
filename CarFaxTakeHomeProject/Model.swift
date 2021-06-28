//
//  Model.swift
//  CarFaxTakeHomeProject
//
//  Created by Matthew Garlington on 6/28/21.
//

import Foundation


struct CarData:  Codable, Hashable  {
    let listings: [Listings]?
}

struct Listings:  Codable, Hashable {
    var year: Int
    var trim: String
    var make: String
    var model: String
    var currentPrice: Int
    var mileage: Int
    var dealer: Dealer
    var images: Images
}

struct Images: Codable, Hashable {
    var large: [String]
}

struct Dealer: Codable, Hashable {
    var city: String
    var state: String
    var phone: String
}
