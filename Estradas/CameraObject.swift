//
//  CameraObject.swift
//  Estradas
//
//  Created by Carlos Machado on 05/01/23.
//

import SwiftUI

class CameraData: ObservableObject  {
    
    @Published var imigrantes = [CameraView]()
    @Published var anchieta = [CameraView]()
    @Published var peManoel = [CameraView]()
    @Published var conego = [CameraView]()
    
    init(){
        refreshCameraData(cameraData: CameraList.imigrantes)
        refreshCameraData(cameraData: CameraList.anchieta)
        refreshCameraData(cameraData: CameraList.peManoel)
        refreshCameraData(cameraData: CameraList.conego)
    }
    
    func refreshCameraData(cameraData: [Camera])  {
        var camera: [CameraView] = []
        
        switch cameraData {
            
        case CameraList.imigrantes:
            for data in cameraData {
                camera.append(CameraView(url: data.url, km: data.km, desc: data.desc))
            }
            self.imigrantes = camera
            
        case CameraList.anchieta:
            for data in cameraData {
                camera.append(CameraView(url: data.url, km: data.km, desc: data.desc))
            }
            self.anchieta = camera
            
        case CameraList.peManoel:
            for data in cameraData {
                camera.append(CameraView(url: data.url, km: data.km, desc: data.desc))
            }
            self.peManoel = camera
            
        case CameraList.conego:
            for data in cameraData {
                camera.append(CameraView(url: data.url, km: data.km, desc: data.desc))
            }
            self.conego = camera
            
        default:
            return
        }
        
    }
    
}
