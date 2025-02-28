//
//  Home.swift
//  MonitoriasProjeto
//
//  Created by Turma02-22 on 26/02/25.
//

import SwiftUI

struct Home: View {
    @State var sheet = false
    var body: some View {
        VStack{
            HStack{
                Text("MEU DIA")
                    .foregroundColor(.white)
                    .frame(width: 130)
                    .font(Font.custom("arial", size: 20))
                    .padding()
                    .background(minhaCor)
                    .padding(.top, 1)
                    .shadow(color: minhaCor, radius: 5)
                Spacer()
            }
            Button(action: {}){
                Text("INICIAR O CARDIO")
                    .padding()
                    .foregroundColor(.white)
                    .frame(width: 250)
                    .background(azul)
                    .cornerRadius(10)
                    .padding(.top, 70)
                    .shadow(color: minhaCor, radius: 10)
                
            }
            HStack{
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        ForEach(arrayData) { dat in
                            VStack{
                                VStack{
                                    Text(dat.dat)
                                        .padding(.top, 50)
                                        .font(Font.custom("arial", size: 40))
                                        .foregroundColor(.azulBonito)
                                    Spacer()
                                }
                                HStack{
                                    Spacer()
                                    Text(dat.dia)
                                        .foregroundStyle(Color.white)
                                        .font(Font.custom("arial", size: 30))
                                        .padding()
                                }
                            }
                            .frame(width: 250, height: 150)
                            .background(minhaCor)
                            .cornerRadius(10)
                            .shadow(color: minhaCor, radius: 3)
                        }
                        
                        .padding(.top, 20)
                        
                    }
                    .padding(.leading, 10)
                    
                    
                }
            }
            .padding(.top, 30)
            Spacer()
        }
    }
}

#Preview {
    Home()
}
