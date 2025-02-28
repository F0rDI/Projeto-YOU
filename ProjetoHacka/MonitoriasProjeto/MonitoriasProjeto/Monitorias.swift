//
//  Monitorias.swift
//  MonitoriasProjeto
//
//  Created by Turma02-22 on 26/02/25.
//

import SwiftUI

struct Monitorias: View {
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading){
                    Text("Monitorias")
                        .font(Font.custom("arial", size: 20))
                        .frame(width: 200)
                        .background(Color.blue)
                        .padding(EdgeInsets())
                        .padding(15)
                    
                }
                Spacer()
            }
            Spacer()
        }
    }
}

#Preview {
    Monitorias()
}
