import SwiftUI

struct Home: View {
    // Controla o índice do dia atual (qual card mostrar)
    @State var scrollIndex: Int = 0
    
    // Controla qual card está expandido. Se for nil, nenhum está expandido
    @State private var expandedIndex: Int? = nil
    
    var body: some View {
        VStack {
            // Cabeçalho com o título "MEU DIA"
            HStack {
                
                Text("MEU DIA")
                    .foregroundColor(.white)
                    .frame(width: 130)
                    .font(Font.custom("Arial", size: 20).bold())
                    .padding()
                    .background(azul)   // Usa a cor "azul" sem alterar
                    .padding(.top, 1)
                    .shadow(color: minhaCor, radius: 5)
                Spacer()
                Button("ENVIAR") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }.foregroundColor(.white)
                    .frame(width: 130)
                    .font(Font.custom("Arial", size: 20).bold())
                    .padding()
                    .background(Color.red)   // Usa a cor "azul" sem alterar
                    .padding(.top, 1)
                    .shadow(color: minhaCor, radius: 5)
            
            }
            
            // Botão "INICIAR O CARDIO"
            Button(action: {
                // Ação para iniciar o cardio
            }) {
                Text("INICIAR O CARDIO")
                    .padding()
                    .font(Font.custom("Arial", size: 20).bold())
                    .foregroundColor(.white)
                    .frame(width: 250)
                    .background(minhaCor) // Usa a cor "minhaCor" sem alterar
                    .cornerRadius(10)
                    .padding(.top, 70)
                    .shadow(color: minhaCor, radius: 10)
            }
            
            // Layout horizontal: seta esquerda, card atual, seta direita
            HStack {
                // Botão para ir ao dia anterior
                Button (action: {
                    if scrollIndex > 0 {
                        scrollIndex -= 1
                    }
                }) {
                    Image(systemName: "chevron.left")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(8)
                        .background(minhaCor)
                        .clipShape(Circle())
                        .padding(.leading, 5)
                        .shadow(color: minhaCor ,radius: 5)
                }
                
                // Pegamos o item (dia) correspondente ao scrollIndex atual
                let item = arrayData[scrollIndex]
                
                VStack {
                    // Parte principal do card (data e dia)
                    VStack {
                            Text(item.dat)
                                .padding(.top, 30)
                                .font(Font.custom("Impact", size: 40).bold())
                                .foregroundColor(.white)
                            
                            HStack {
                                Spacer()
                                Text(item.dia)
                                    .padding()
                                    .foregroundStyle(azul)
                                    .font(Font.custom("Arial", size: 30))
                                    //.padding(.bottom, 15)
                            }
                    }
                    
                    .onTapGesture {
                        // Ao tocar, expande/colapsa as infos adicionais
                        withAnimation {
                            if expandedIndex == scrollIndex {
                                expandedIndex = nil
                            } else {
                                expandedIndex = scrollIndex
                            }
                        }
                    }
                    
                    // Se este card estiver expandido, mostra a parte extra
                    if expandedIndex == scrollIndex {
                        // Rolagem vertical caso as infos sejam grandes
                        ScrollView(.vertical, showsIndicators: true) {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Refeição do dia:")
                                    .font(.headline)
                                Text("Almoço às 12h30 — Ingredientes: arroz, feijão, frango…")
                                Text("Lanche às 16h — Ingredientes: frutas, iogurte…")
                                Text("Jantar às 20h — Ingredientes: salada, peixe…")
                                // Adicione mais linhas conforme necessário
                            }
                            .padding()
                            .foregroundColor(.white)
                        }
                        .frame(minHeight: 150) // Limita a altura do "popup"
                        .background(azul.opacity(0.9))
                        .cornerRadius(8)
                        .transition(.move(edge: .bottom))
                    }
                }
                
                .frame(width: 250)           // Largura fixa do card
                .background(minhaCor)
                .cornerRadius(10)
                .shadow(color: minhaCor, radius: 3)
                .padding(.bottom, expandedIndex == scrollIndex ? 20 : 0)
                
                // Botão para ir ao próximo dia
                Button (action: {
                    if scrollIndex < arrayData.count - 1 {
                        scrollIndex += 1
                    }
                }) {
                    Image(systemName: "chevron.right")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(8)
                        .background(minhaCor)
                        .clipShape(Circle())
                        .padding(5)
                        .shadow(color: minhaCor ,radius: 5)
                }
            }
            .padding(.top, 70)
            
            Spacer()
        }
    }
}

// Preview somente para teste no Canvas do Xcode
#Preview {
    Home()
}
