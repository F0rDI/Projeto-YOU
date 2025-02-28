//
//  PesoView.swift
//  desafioFinal
//
//  Created by Turma02-Backup on 27/02/25.
//

import SwiftUI

struct PesoView: View {
    var metapesos: pessoa?
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                ZStack {
                    Rectangle()
                        .fill(.gray)
                        .ignoresSafeArea(.all)
                    Text("Peso")
                        .foregroundColor(.white)

                }
                
                Spacer()
                
                
            }
            
            Spacer()
            
            ScrollView(.horizontal) {
                ForEach(metapesos.registroPesos) { cores in
                        Rectangle()
                    
                    if cores {
                        .fill(.green)
                    }
                    else {
                        .fill(.red)
                    }
                }
            }
            
            Spacer()
            
            HStack {
                Button (action: )
            }
        }
        
        
        
    }
}

#Preview {
    PesoView()
}
