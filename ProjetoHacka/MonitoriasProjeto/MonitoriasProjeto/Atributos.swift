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

struct dadosDormir {
    var horasAcordou: Date?
    var horasDeitou: Date?
}

struct refeicao {
    var horario: Date?
    var ingredientes: [String]?
    var preparo: [String]?
}

struct cronograma {
    var horario: Date?
    var descricao: [String]?
}


struct tumtum {
    var horarioInicio: Int?
    var horarioFim: Int?
    var valor: Double?
}

struct planejamento {
    var cafeManha: refeicao?
    var almoco: refeicao?
    var jantar: refeicao?
    var treino: cronograma?
}

struct dados {
    var dia: Date?
    var agua: Bool?
    var sono: dadosDormir?
    var batimentos: tumtum?
    var peso: Double?
    var metasDiarias: planejamento?
}

struct pessoa: Decodable {
    var registroPesos: [Bool]?
    var pesoMes: Double?
    var aguaTotal: Int?
    var dadosTotais: [dados]?
}

