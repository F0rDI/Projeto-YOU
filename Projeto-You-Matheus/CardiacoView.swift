//
//  CardiacoView.swift
//  desafioFinal
//
//  Created by Turma02-Backup on 27/02/25.
//

import SwiftUI

struct CardiacoView: View {
    var dadosatt: pessoa?
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                ZStack {
                    Rectangle()
                        .fill(.gray)
                        .ignoresSafeArea(.all)
                    Text("Cardiaco")
                        .foregroundColor(.white)

                }
                Spacer()
            }
            
            Spacer()
            
            ScrollView {
                
                ForEach (dadosatt?.dadosTotais) { item in 
                    
                    HStack {
                        Text (item.dia)
                        
                        Spacer()
                        
                        VStack {
                            
                            Text ("Inicio: " item.batimentos?.horarioInicio)
                            
                            Text ("Fim: " item.batimentos?.horarioFim)
                            
                        }
                        
                        Text (item.batimentos?.valor, "MRP")
                        
                        
                    }
                    
                    
                    
                    
                }
                
                
            }
            
        }
        
    }
}

#Preview {
    CardiacoView()
}
