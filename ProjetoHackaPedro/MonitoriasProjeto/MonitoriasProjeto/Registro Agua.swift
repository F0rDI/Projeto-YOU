//
//  Registro Agua.swift
//  temp
//
//  Created by Turma02-Backup on 10/03/25.
//

import SwiftUI

struct Registro_Agua: View {
    var dados: Bool = true
    let actualDate = (Date.now)
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Image(systemName: "drop.circle.fill")
                    .resizable()
                    .frame(width: 30.0, height: 30.0)
                    .foregroundColor(.blue)
                
                
                ZStack {
                    Rectangle()
                        .frame(width: 130.0, height: 30.0)
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                    
                    Text ("Metas de água")
                        .foregroundColor(.white)
                }
            
                Spacer()
                
            }
            
            Spacer()
            
            ScrollView {
                
                ZStack {
                    
                    
                    if (dados) {
                        Rectangle()
                        .foregroundColor(.green)
                        .cornerRadius(10)
                        .shadow(color: .green ,radius: 3)
                    }
                    else {
                        Rectangle()
                        .foregroundColor(.red)
                        .cornerRadius(10)
                        .shadow(color: .red ,radius: 3)
                    }
                    
                    Text (actualDate, format: .dateTime.day().month())
                        .offset(x:20)
                        .foregroundColor(.white)

                }
            }
            
        }
        .padding()
        
        
    }
}

#Preview {
    Registro_Agua()
}
