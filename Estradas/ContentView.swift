//
//  ContentView.swift
//  Estradas
//
//  Created by Carlos Machado on 26/09/21.
//

import SwiftUI

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

struct ContentView: View {
    
    @ObservedObject var data = CameraData()
    
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
                data.loadCameraData(cameraData: CameraList.imigrantes)
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
                data.loadCameraData(cameraData: CameraList.anchieta)
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
                data.loadCameraData(cameraData: CameraList.peManoel)
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
                data.loadCameraData(cameraData: CameraList.conego)
            }
            
            NavigationView {
                ScrollView {
                    
                }
                .navigationTitle("Informações")
            }.tabItem {
                Text("Informações")
                Image(systemName: "info.circle.fill")
            }
            
        }
    }
}
