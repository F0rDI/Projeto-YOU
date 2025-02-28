//
//  AguaView.swift
//  desafioFinal
//
//  Created by Turma02-Backup on 27/02/25.
//

import SwiftUI

struct AguaView: View {
    var dadosatt: pessoa?
    
    var body: some View {
        
        VStack {
                
            HStack {
                
                ZStack {
                    Rectangle()
                        .fill(.gray)
                        .ignoresSafeArea(.all)
                    Text("Agua")
                        .foregroundColor(.white)

                }
                Spacer()
            }
            
            Spacer()
            
            ScrollView {
                ForEach (dadosatt.dadosTotais) { conteudo in
                    
                    Rectangle() {
                        if (conteudo.agua) {
                            .fill(.green)
                        }
                        else {
                            .fill(.red)
                        }
                    }
                    
                    Text (conteudo.dia)
                    
                }
            }
            
            Spacer()
            
            Text ("Voce esta ",  dadosatt?.aguaTotal, " dias completando a meta diaria")
            
        }
        
        
        
        
    }
}

#Preview {
    AguaView()
}
