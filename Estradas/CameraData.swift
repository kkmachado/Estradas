//
//  CamerasData.swift
//  Estradas
//
//  Created by Carlos Machado on 03/01/23.
//

import SwiftUI

struct Camera: Identifiable, Equatable {
  let id = UUID()
  let url: String
  let km: String
  let desc: String
}

struct CameraList {
        
    static let imigrantes = [
        Camera(url:"https://api.ecorodovias.com.br/anonymous/ecorodovias-portal/ecovias/boletim/camera/3", km: "KM 12", desc: "Entrada"),
        Camera(url:"https://api.ecorodovias.com.br/anonymous/ecorodovias-portal/ecovias/boletim/camera/2", km: "KM 28", desc: "Balança"),
        Camera(url:"https://api.ecorodovias.com.br/anonymous/ecorodovias-portal/ecovias/boletim/camera/4", km: "KM 32", desc: "Pedágio"),
        Camera(url:"https://api.ecorodovias.com.br/anonymous/ecorodovias-portal/ecovias/boletim/camera/15", km: "KM 40", desc: "Interligação"),
        Camera(url:"https://api.ecorodovias.com.br/anonymous/ecorodovias-portal/ecovias/boletim/camera/6", km: "KM 48", desc: "Serra"),
        Camera(url:"https://api.ecorodovias.com.br/anonymous/ecorodovias-portal/ecovias/boletim/camera/7", km: "KM 56", desc: "Balança Baixada"),
        Camera(url:"https://api.ecorodovias.com.br/anonymous/ecorodovias-portal/ecovias/boletim/camera/8", km: "KM 59", desc: "Acesso Baixada"),
    ]
    
    static let anchieta = [
        Camera(url: "https://api.ecorodovias.com.br/anonymous/ecorodovias-portal/ecovias/boletim/camera/11", km: "KM 13", desc: "Ribeirão dos Couros"),
        Camera(url: "https://api.ecorodovias.com.br/anonymous/ecorodovias-portal/ecovias/boletim/camera/13", km: "KM 23", desc: "Trevo da Volkswagen"),
        Camera(url: "https://api.ecorodovias.com.br/anonymous/ecorodovias-portal/ecovias/boletim/camera/14", km: "KM 31", desc: "Pedágio"),
        Camera(url: "https://api.ecorodovias.com.br/anonymous/ecorodovias-portal/ecovias/boletim/camera/12", km: "KM 43", desc: "Serra"),
        Camera(url: "https://api.ecorodovias.com.br/anonymous/ecorodovias-portal/ecovias/boletim/camera/1", km: "KM 55", desc: "Trevo Cubatão"),
        Camera(url: "https://api.ecorodovias.com.br/anonymous/ecorodovias-portal/ecovias/boletim/camera/16", km: "KM 65", desc: "Entrada de Santos")
    ]
    
    static let peManoel = [
        Camera(url: "https://api.ecorodovias.com.br/anonymous/ecorodovias-portal/ecovias/boletim/camera/10", km: "KM 280", desc: "Pedágio São Vicente"),
        Camera(url: "http://www.der.sp.gov.br/Upload/Cameras/CamSP055KM293S2.jpg", km: "KM 293", desc: "Praia Grande"),
        Camera(url: "http://www.der.sp.gov.br/Upload/Cameras/CamSP055km311S1.jpg", km: "KM 311", desc: "Mongaguá"),
        Camera(url: "http://www.der.sp.gov.br/Upload/Cameras/CamSP055km323S1.jpg", km: "KM 323", desc: "Itanhaém"),
        Camera(url: "http://www.der.sp.gov.br/Upload/Cameras/CamSP055km337S1.jpg", km: "KM 337", desc: "Itanhaém"),
        Camera(url: "http://www.der.sp.gov.br/Upload/Cameras/CamSP055km344S1.jpg", km: "KM 344", desc: "Peruíbe")
    ]
    
    static let conego = [
        Camera(url: "https://api.ecorodovias.com.br/anonymous/ecorodovias-portal/ecovias/boletim/camera/9", km: "KM 250", desc: "Pedágio Guarujá")
    ]
    
}
