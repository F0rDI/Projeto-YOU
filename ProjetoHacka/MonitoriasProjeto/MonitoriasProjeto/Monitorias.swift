//
//  Monitorias.swift
//  MonitoriasProjeto
//
//  Created by Turma02-22 on 26/02/25.
//

import SwiftUI

struct Monitorias: View {
    let minhaCor = Color.black
    let azul = Color.black
    
    @State private var batimentos: Int? = nil
    @State private var medindo: Bool = false
    @State private var mensagemErro: String? = nil

    var body: some View {
        VStack {
            HStack {
                Text("MONITORAMENTO")
                    .font(Font.custom("arial", size: 20))
                    .padding()
                    .background(minhaCor)
                    .foregroundColor(.white)
                    .padding(.top, 1)
                Spacer()
            }
            HStack {
                VStack {
                    HStack {
                        Image(systemName: "powersleep")
                            .foregroundColor(Color.yellow)
                        Text("Sono")
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding()
                    .background(minhaCor)
                    .cornerRadius(50)
                    .padding()
                    
                    HStack {
                        Image(systemName: "suit.heart.fill")
                            .foregroundColor(Color.red)
                        if let bat = batimentos {
                            Text("Média de batimentos: \(bat) BPM")
                                .foregroundColor(.white)
                        } else {
                            Text("Média de batimentos")
                                .foregroundColor(.white)
                        }
                        Spacer()
                        Button(action: {
                            medirBatimentos()
                        }) {
                            if medindo {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            } else {
                                Image(systemName: "arrow.clockwise")
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .padding()
                    .background(minhaCor)
                    .cornerRadius(50)
                    .padding()
                    
                    HStack {
                        Image(systemName: "scalemass.fill")
                            .foregroundColor(.white)
                        Text("Peso atual")
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding()
                    .background(minhaCor)
                    .cornerRadius(50)
                    .padding()
                    
                    HStack {
                        Image(systemName: "drop.fill")
                            .foregroundColor(azul)
                        Text("Meta de Água")
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding()
                    .background(minhaCor)
                    .cornerRadius(50)
                    .padding()
                }
                .padding(.top, 150)
                Spacer()
            }
            
            if let erro = mensagemErro {
                Text("Erro: \(erro)")
                    .foregroundColor(.red)
                    .padding()
            }
            Spacer()
        }
        .background(Color.white.ignoresSafeArea())
    }
    
    // Função de requisição ao Node-RED/Arduino
    func medirBatimentos() {
        medindo = true
        mensagemErro = nil
        
        // Substitua pela URL do seu Node-RED/Arduino
        guard let url = URL(string: "http://192.168.1.100:1880/measure") else {
            mensagemErro = "URL inválida"
            medindo = false
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                medindo = false
                
                if let error = error {
                    mensagemErro = error.localizedDescription
                    return
                }
                
                guard let data = data else {
                    mensagemErro = "Dados não recebidos"
                    return
                }
                
                // JSON no formato: { "heartRate": 75 }
                if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let batimento = json["heartRate"] as? Int {
                    batimentos = batimento
                } else {
                    mensagemErro = "Formato de dados inválido"
                }
            }
        }.resume()
    }
}

#Preview {
    Monitorias()
}
