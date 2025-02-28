//
//  Home.swift
//  MonitoriasProjeto
//
//  Created by Turma02-22 on 26/02/25.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack{
            HStack{
                Text("MEU DIA")
                    .foregroundColor(.white)
                    .font(Font.custom("arial", size: 20))
                    .padding()
                    .background(minhaCor)
                    .padding(.top, 1)
                
                Spacer()
            }
            Spacer()
        }
    }
}

#Preview {
    Home()
}
