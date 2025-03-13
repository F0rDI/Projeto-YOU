import SwiftUI

struct PesoTeste: View {
    var dados: Bool = true
    let actualDate = Date.now
    var meta: Int = 12
    var pesoAtual: Float = 90
    
    var body: some View {
        ZStack {
            // Fundo gradiente como nas outras telas
            LinearGradient(
                gradient: Gradient(colors: [Color.white.opacity(0.9), Color.white]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack {
                // Cabeçalho no mesmo estilo das outras telas
                HStack {
                    Text("Peso")
                        .foregroundColor(.white)
                        .frame(width: 130)
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(azul)
                                .shadow(color: azul.opacity(0.5), radius: 10, x: 0, y: 5)
                        )
                        .padding(.top, 1)
                    Spacer()
                }.padding()
                
                ScrollView {
                    ForEach((1...31).reversed(), id: \.self) { i in
                        VStack{
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                dados ? Color.green : minhaCor,
                                                dados ? Color.green.opacity(0.8) : minhaCor.opacity(0.8)
                                            ]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                                    .shadow(color: dados ? Color.green.opacity(0.6) : minhaCor.opacity(0.6), radius: 15, x: 0, y: 8)
                                    .frame(width: 300, height: 70)
                                
                                VStack {
                                    Text("Data:\(i)/03/2025")
                                    Text("Peso:\(pesoAtual) KG")
                                   
                                }
                            }
                            
                        }
                    }
                    
                    
                    
                }
            }
            .padding()
        }
    }
}

#Preview {
    PesoTeste()
}
