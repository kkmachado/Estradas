//
//  ContentView.swift
//  Estradas
//
//  Created by Carlos Machado on 26/09/21.
//
//  Testando o GitHub

import SwiftUI

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ContentView: View {
    
    @ObservedObject var data = CameraData()
    
    @State var operationData = EcoviasData(trafficOperation: TrafficOperationData(name: "", description: "", operation: "", roads: [RoadsData.init(name: "", lanes: "")]), convoy: ConvoyData(hasConvoy: false))
    
    @State var imigrantesDownLanes: Int = 0
    @State var imigrantesUpLanes: Int = 0
    @State var anchietaDownLanes: Int = 0
    @State var anchietaUpLanes: Int = 0
    @State var operationDesc: Substring = ""
        
    func fetchData() async {
        
        // Busca informação na API da Ecovias
        
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
        
        
        // Identifica as pistas disponíveis para subida e descida
        
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
        
        
        // Trata a String para remover o texto "Operacao"
        
        let operationDescOriginal = operationData.trafficOperation.description
        
        let start = operationDescOriginal.index(operationDescOriginal.startIndex, offsetBy: 9)
        let end = operationDescOriginal.index(operationDescOriginal.endIndex, offsetBy: 0)
        let range = start..<end

        operationDesc = operationDescOriginal[range]
        
    }
    
    var body: some View {
        TabView {
            NavigationView {
                ScrollView {
                    ForEach(data.imigrantes) { camera in
                        CameraView(url: camera.url, km: camera.km , desc: camera.desc)
                    }
                }
                .navigationTitle("Imigrantes")
            }.tabItem {
                Text("Imigrantes")
                Image("SP160").renderingMode(.template)
            }.refreshable {
                print("Refreshing Imigrantes...")
                data.refreshCameraData(cameraData: CameraList.imigrantes)
            }
            
            NavigationView {
                ScrollView {
                    ForEach(data.anchieta) { camera in
                        CameraView(url: camera.url, km: camera.km , desc: camera.desc)
                    }
                }
                .navigationTitle("Anchieta")
            }.tabItem {
                Text("Anchieta")
                Image("SP150").renderingMode(.template)
            }.refreshable {
                print("Refreshing Anchieta...")
                data.refreshCameraData(cameraData: CameraList.anchieta)
            }
            
            NavigationView {
                ScrollView {
                    ForEach(data.peManoel) { camera in
                        CameraView(url: camera.url, km: camera.km , desc: camera.desc)
                    }
                }
                .navigationTitle("Pe. Manoel da Nóbrega")
            }.tabItem {
                Text("Pe. Manoel")
                Image("SP55").renderingMode(.template)
            }.refreshable {
                print("Refreshing Pe. Manoel...")
                data.refreshCameraData(cameraData: CameraList.peManoel)
            }
            
            NavigationView {
                ScrollView {
                    ForEach(data.conego) { camera in
                        CameraView(url: camera.url, km: camera.km , desc: camera.desc)
                    }
                }
                .navigationTitle("Cônego Domênico Rangoni")
            }.tabItem {
                Text("Cônego")
                Image("SP55").renderingMode(.template)
            }.refreshable {
                print("Refreshing Cônego...")
                data.refreshCameraData(cameraData: CameraList.conego)
            }
            
            NavigationView {
                ScrollView {
                    VStack(alignment: .leading) {
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text(operationDesc)
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(Color.green)
                                    .padding(.top, 2)
                            }
                            Spacer()
                            VStack{
                                Text("\(operationData.trafficOperation.name)")
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(Color.white)
                            }
                            .padding(.vertical,10)
                            .padding(.horizontal,15)
                            .background(Color.green)
                            .cornerRadius(8)
                        }.padding(.vertical, 20)
                                                
                        Divider()
                        
                        VStack(alignment: .leading) {
                            Text("Rodovia dos Imigrantes")
                                .font(.title3)
                                .bold()
                                .padding(.bottom,1)
                            HStack {
                                Image(systemName: "arrow.up.circle.fill")
                                    .foregroundColor(Color.gray)
                                Text("\(imigrantesUpLanes) pistas para subida")
                                    .font(.body)
                                    .foregroundColor(Color.gray)
                                    .padding(.bottom,1)
                            }
                            HStack {
                                Image(systemName: "arrow.down.circle.fill")
                                    .foregroundColor(Color.gray)
                                Text("\(imigrantesDownLanes) pistas para descida")
                                    .font(.body)
                                    .foregroundColor(Color.gray)
                            }
                        }.padding(.vertical, 20)
                                                
                        Divider()
                        
                        VStack(alignment: .leading) {
                            Text("Rodovia Anchieta")
                                .font(.title3)
                                .bold()
                                .padding(.bottom,1)
                            HStack {
                                Image(systemName: "arrow.up.circle.fill")
                                    .foregroundColor(Color.gray)
                                Text("\(anchietaUpLanes) pistas para subida")
                                    .font(.body)
                                    .foregroundColor(Color.gray)
                                    .padding(.bottom,1)
                            }
                            HStack {
                                Image(systemName: "arrow.down.circle.fill")
                                    .foregroundColor(Color.gray)
                                Text("\(anchietaDownLanes) pistas para descida")
                                    .font(.body)
                                    .foregroundColor(Color.gray)
                            }
                        }.padding(.vertical, 20)
                        
                    }
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: .infinity,
                        alignment: .topLeading
                    )
                    .padding()
                }
                .task {
                    await fetchData()
                }
                .refreshable {
                    print("Refreshing Operações...")
                    await fetchData()
                }
                .navigationTitle("Operação")
            }
            .tabItem {
                Text("Operação")
                Image(systemName: "info.circle.fill")
            }
        }
    }
}
