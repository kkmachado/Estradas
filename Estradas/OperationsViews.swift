//
//  OperationsViews.swift
//  Estradas
//
//  Created by Carlos Machado on 05/01/23.
//

import SwiftUI

struct RoadLanes: View {
    @State var roadName: String
    @State var upLanes: String
    @State var downLanes: String
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(roadName)
                .font(.title3)
                .bold()
                .padding(.bottom,1)
            HStack {
                Image(systemName: "arrow.up.circle.fill")
                    .foregroundColor(Color.gray)
                Text("\(upLanes) pistas para subida")
                    .font(.body)
                    .foregroundColor(Color.gray)
                    .padding(.bottom,1)
            }
            HStack {
                Image(systemName: "arrow.down.circle.fill")
                    .foregroundColor(Color.gray)
                Text("\(downLanes) pistas para descida")
                    .font(.body)
                    .foregroundColor(Color.gray)
            }
        }.padding(.vertical, 20)
    }
}

struct OperationData: View {
    @State var operationDesc: String
    @State var operationLanes: String
    
    var body: some View {
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
                Text(operationLanes)
                    .font(.title)
                    .bold()
                    .foregroundColor(Color.white)
            }
            .padding(.vertical,10)
            .padding(.horizontal,15)
            .background(Color.green)
            .cornerRadius(8)
        }.padding(.vertical, 20)
    }
}
