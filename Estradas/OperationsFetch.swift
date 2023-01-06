//
//  OperationsFetch.swift
//  Estradas
//
//  Created by Carlos Machado on 05/01/23.
//

import SwiftUI

class OperationsFetch: ObservableObject {
    
    @Published var operationData = EcoviasData(trafficOperation: TrafficOperationData(name: "", description: "", operation: "", roads: [RoadsData.init(name: "", lanes: "")]), convoy: ConvoyData(hasConvoy: false))
    
    @Published var imigrantesDownLanes: Int = 0
    @Published var imigrantesUpLanes: Int = 0
    @Published var anchietaDownLanes: Int = 0
    @Published var anchietaUpLanes: Int = 0
    
    func getOperationData() {
        let urlString = "https://api.ecorodovias.com.br/anonymous/ecorodovias-portal/ecovias/playful-map"
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!) {data, _, error in
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let decodedData = try JSONDecoder().decode(EcoviasData.self, from: data)
                        self.operationData = decodedData
                        print("Dados recebidos")
                        print(self.operationData)
                    } catch {
                        print("Something went wrong")
                    }
                }
            }
        }.resume()

        let imigrantesLanesData = operationData.trafficOperation.roads[0].lanes
//        let anchietaLanesData = operationData.trafficOperation.roads[1].lanes
        imigrantesDownLanes = 0
        imigrantesUpLanes = 0
        anchietaDownLanes = 0
        anchietaUpLanes = 0
        
        for index in imigrantesLanesData.indices {
            if imigrantesLanesData[index] == "D" {
                imigrantesDownLanes = imigrantesDownLanes + 1
            }
        }
    }
    
}


