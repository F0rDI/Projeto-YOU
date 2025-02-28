//
//  SonoView.swift
//  desafioFinal
//
//  Created by Turma02-Backup on 27/02/25.
//

import SwiftUI

struct SonoView: View {
    
    var dadosatt: pessoa?
    
    var body: some View {
        
        VStack {
            HStack {
                
                ZStack {
                    Rectangle()
                        .fill(.gray)
                        .ignoresSafeArea(.all)
                    Text("Sono")
                        .foregroundColor(.white)

                }
                Spacer()
            }
            
            Spacer()
            
            ScrollView {
                
                ForEach (dadosatt?.dadosTotais) item in {
                    
                    HStack {
                        Text (item.dia)
                        
                        Spacer()
                        
                        VStack {
                            Text ("Acordei ", item.sono?.horasAcordou)
                            
                            Text ("Dormi ", item.sono?.horasDeitou)
                        }
                        
                    }
                    
                    
                    
                }
                
                
            }
        }
        
    }
}

#Preview {
    SonoView()
}
