//
//  OperationsData.swift
//  Estradas
//
//  Created by Carlos Machado on 05/01/23.
//

import Foundation

struct EcoviasData: Decodable {
    var trafficOperation: TrafficOperationData
    var convoy: ConvoyData
    
    enum CodingKeys: String, CodingKey {
        case trafficOperation = "TrafficOperation"
        case convoy = "Convoy"
    }
}

struct TrafficOperationData: Decodable {
    var name: String
    var description: String
    var operation: String
    var roads: [RoadsData]
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case description = "Description"
        case operation = "Operation"
        case roads = "Roads"
    }
}

struct RoadsData: Decodable {
    var name: String
    var lanes: String

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case lanes = "Lanes"
    }
}

struct ConvoyData: Decodable {
    var hasConvoy: Bool
    
    enum CodingKeys: String, CodingKey {
        case hasConvoy = "HasConvoy"
    }
}

