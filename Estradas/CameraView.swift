//
//  CameraView.swift
//  Estradas
//
//  Created by Carlos Machado on 26/09/21.
//

import SwiftUI

struct CameraView: View, Identifiable {
    @State var id = UUID()
    @State var url: String
    @State var km: String
    @State var desc: String
        
    var body: some View {
        VStack(alignment: .leading){
            VStack {
                AsyncImage(url: URL(string: url)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ZStack {
                        ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .black))
                        Color.white.opacity(0.5)
                    }.frame(height:250)
                }
            }.frame(maxWidth: .infinity)
            HStack(alignment: .top){
                Text(km).font(.title3).bold().foregroundColor(.black)
                Spacer()
                Text(desc).font(.body).foregroundColor(.black).multilineTextAlignment(.trailing)
            }
            .padding(.horizontal)
            .padding(.top, 5)
            .padding(.bottom, 10)
        }
        .background(Color.accentColor)
        .cornerRadius(8)
        .padding()
        .shadow(color: Color("shadow"), radius: 8, x: 0, y: 8)
    }
}
