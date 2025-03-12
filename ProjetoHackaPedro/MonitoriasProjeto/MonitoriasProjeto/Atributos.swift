//
//  Atributos.swift
//  MonitoriasProjeto
//
//  Created by Turma02-22 on 28/02/25.
//

import Foundation
import SwiftUI

var minhaCor : Color = Color.pretoCinza
var azul : Color = Color.azulBonito

struct Data : Identifiable{
    var id: Int
    var dat: String
    var dia: String
}

var arrayData = [Data(id: 1, dat: "01/02", dia: "Segunda"), Data(id: 2, dat: "02/02", dia: "Terca"), Data(id: 3, dat: "03/02", dia: "Quarta"), Data(id: 4, dat: "04/02", dia: "Quinta"), Data(id: 5, dat: "05/02", dia: "Sexta"), Data(id: 6, dat: "06/02", dia: "Sabado"), Data(id: 7, dat: "07/02", dia: "Domingo")]


struct dados {
    var dia: Int?
    var agua: Bool?
    
    var horasAcordou: Int?
    var horasDeitou: Int
    
    var InicioCardio: Int?
    var FimCardio: Int?
    var valor: Int?
    
    var peso: Double?
    
    var horarioCafe: Int?
    var ingredientesCafe: String?
    
    var horarioAlmo: Int?
    var ingredientesAlmo: String?
    
    var horarioJantar: Int?
    var ingredientesJantar: String?
    
    var horarioTreino: Int?
    var descricaoTreino: String?
}

struct pessoa: Decodable, Hashable {
    var _id: String?         // Agora _id tem tipo definido
    var pesoMes: Double?
    var aguaTotal: Int?
    var dadosTotais: [dados]?
}
