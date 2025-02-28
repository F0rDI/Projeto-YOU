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
    
    @State private var heartRate: Int? = nil
    @State private var isMeasuring: Bool = false
    @State private var errorMessage: String? = nil

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
                        if let hr = heartRate {
                            Text("Média de batimentos: \(hr) BPM")
                                .foregroundColor(.white)
                        } else {
                            Text("Média de batimentos")
                                .foregroundColor(.white)
                        }
                        Spacer()
                        Button(action: {
                            measureHeartRate()
                        }) {
                            if isMeasuring {
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
                        Text("Meta de Agua")
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
            
            if let error = errorMessage {
                Text("Erro: \(error)")
                    .foregroundColor(.red)
                    .padding()
            }
            Spacer()
        }
        .background(Color.white.ignoresSafeArea())
    }
    
    func measureHeartRate() {
        isMeasuring = true
        errorMessage = nil
        
        // URL do Node-RED/Arduino
        guard let url = URL(string: "http://192.168.1.100:1880/measure") else {
            errorMessage = "URL inválida"
            isMeasuring = false
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                isMeasuring = false
                
                if let error = error {
                    errorMessage = error.localizedDescription
                    return
                }
                
                guard let data = data else {
                    errorMessage = "Dados não recebidos"
                    return
                }
                
                // JSON no formato: { "heartRate": 75 }
                if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let rate = json["heartRate"] as? Int {
                    heartRate = rate
                } else {
                    errorMessage = "Formato de dados inválido"
                }
            }
        }.resume()
    }
}

#Preview {
    Monitorias()
}
