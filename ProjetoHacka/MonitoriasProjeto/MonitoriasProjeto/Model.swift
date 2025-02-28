//
//  Model.swift
//  desafioFinal
//
//  Created by Turma02-Backup on 27/02/25.
//

import Foundation

struct dadosDormir {
    var horasAcordou: Int?
    var horasDeitou: Int?
}

struct refeicao {
    var horario: Int?
    var ingredientes: [String]?
    var preparo: [String]?
}

struct cronograma {
    var horario: Int?
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
    var dia: Int?
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

