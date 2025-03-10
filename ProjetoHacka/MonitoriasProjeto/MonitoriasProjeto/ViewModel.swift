//
//  ViewModel.swift
//  desafioFinal
//
//  Created by Turma02-Backup on 27/02/25.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var usuario: pessoa?
    
    func fetch(){
        var url = ""
        
        var task = URLSession.shared.dataTask(with: URL(string: url)!){ dados, _, error in
            
            do {
                self.usuario = try JSONDecoder().decode(pessoa.self, from: dados!)
            } catch {
                print (error)
            }
            
        }
        task.resume
    }
}
