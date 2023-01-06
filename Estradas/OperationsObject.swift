//
//  OperationsObject.swift
//  Estradas
//
//  Created by Carlos Machado on 06/01/23.
//

import SwiftUI

class OperationsObject: ObservableObject {
    
    @Published var operationData = EcoviasData(trafficOperation: TrafficOperationData(name: "", description: "", operation: "", roads: [RoadsData.init(name: "", lanes: "")]), convoy: ConvoyData(hasConvoy: false))
    
    @State var imigrantesDownLanes: Int = 0
    @State var imigrantesUpLanes: Int = 0
    @State var anchietaDownLanes: Int = 0
    @State var anchietaUpLanes: Int = 0
    
    func fetchData() async {
        guard let url = URL(string: "https://api.ecorodovias.com.br/anonymous/ecorodovias-portal/ecovias/playful-map") else {
            print ("Something is wrong with the URL" )
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data( from: url)
            if let decodedResponse = try? JSONDecoder().decode(EcoviasData.self, from: data) {
                operationData = decodedResponse
            }
        }
        catch {
            print("This data isn't valid")
        }
        
        let imigrantesLanesData = operationData.trafficOperation.roads[0].lanes
        let anchietaLanesData = operationData.trafficOperation.roads[1].lanes
        
        imigrantesDownLanes = 0
        imigrantesUpLanes = 0
        anchietaDownLanes = 0
        anchietaUpLanes = 0
        
        for index in imigrantesLanesData.indices {
            if imigrantesLanesData[index] == "D" {
                imigrantesDownLanes = imigrantesDownLanes + 1
            } else {
                imigrantesUpLanes = imigrantesUpLanes + 1
            }
        }
        
        for index in anchietaLanesData.indices {
            if anchietaLanesData[index] == "D" {
                anchietaDownLanes = anchietaDownLanes + 1
            } else {
                anchietaUpLanes = anchietaUpLanes + 1
            }
        }
        
    }
}
