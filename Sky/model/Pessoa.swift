//
//  Pessoa.swift
//  Sky
//
//  Created by Renan Silva on 16/10/23.
//

import Foundation
struct Pessoa: Identifiable {
    
    let id = UUID()
    let nome: String
    
    init(nome: String) {
        self.nome = nome
    }
}
