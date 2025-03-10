//
//  Home.swift
//  MonitoriasProjeto
//
//  Created by Turma02-22 on 26/02/25.
//

import SwiftUI

struct Home: View {
    @State var sheet = false
    @State var scrollindex: Int = 0
    
    var body: some View {
        VStack{
            HStack{
                Text("MEU DIA")
                    .foregroundColor(.white)
                    .frame(width: 130)
                    .font(Font.custom("Title", size: 20).bold())
                    .padding()
                    .background(azul)
                    .padding(.top, 1)
                    .shadow(color: minhaCor, radius: 5)
                Spacer()
            }
            
            Button(action: {}){
                Text("INICIAR O CARDIO")
                    .padding()
                    .font(Font.custom("Poppins-regular", size: 20).bold())
                    .foregroundColor(.white)
                    .frame(width: 250)
                    .background(minhaCor)
                    .cornerRadius(10)
                    .padding(.top, 70)
                    .shadow(color: minhaCor, radius: 10)
                
            }
            
            HStack{
                Button (action: {
                    if scrollindex > 0 {
                        scrollindex -= 1
                    }
                }) {
                    Image(systemName: "chevron.left")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(8)
                        .background(minhaCor)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .padding(.leading, 5)
                        .shadow(color: minhaCor ,radius: 5)
                }
                
                ScrollViewReader { proxy in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack{
                            ForEach(Array(arrayData.enumerated()), id: \.offset) {index, dat in
                                VStack{
                                        Text(dat.dat)
                                            .padding(.top, 50)
                                            .font(Font.custom("arial", size: 40).bold())
                                            .foregroundColor(.white)
                                    HStack{
                                        Spacer()
                                        Text(dat.dia)
                                            .padding()
                                            .foregroundStyle(azul)
                                            .font(Font.custom("Times", size: 30))
                                            .padding(.bottom, 15)
                                    }
                                }
                                .frame(width: 250, height: 150)
                                .background(minhaCor)
                                .cornerRadius(10)
                                .shadow(color: minhaCor, radius: 3)
                                .id(index)
                            }
                        }
                        .padding(.top, 20)
                        .padding(.leading, 10)
                    }
                    .onChange(of: scrollindex) { novoNumero in
                        withAnimation{
                            proxy.scrollTo(novoNumero, anchor: .center)
                        }
                    }
                    
                }
                Button (action: {
                    if scrollindex < arrayData.count - 1 {
                        scrollindex += 1
                    }
                }) {
                    Image(systemName: "chevron.right")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(8)
                        .background(minhaCor)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .padding(5)
                        .shadow(color: minhaCor ,radius: 5)
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
