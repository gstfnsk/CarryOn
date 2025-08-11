//
//  Hygiene.swift
//  CarryOn
//
//  Created by Giulia Stefainski on 06/08/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var name: String = ""
    var details: String = ""
    var amount: Int = 1
    var category: [ItemCategory] = [ItemCategory.miscellaneous]
    
    init(name: String, details: String = "", amount: Int = 1, category: [ItemCategory] = [ItemCategory.miscellaneous]) {
        self.name = name
        self.details = details
        self.amount = amount
        self.category = category
    }
    
    static var predefinedItems = [
        Item(name: "Carregador de celular", category: [.electronics]),
        Item(name: "Power bank", category: [.electronics]),
        Item(name: "Fones de ouvido", category: [.electronics]),
        Item(name: "Adaptador de tomada", category: [.electronics]),
        Item(name: "Cabo USB", category: [.electronics]),
        Item(name: "Notebook", category: [.electronics]),
        Item(name: "Carregador do notebook", category: [.electronics]),
        Item(name: "Tablet", category: [.electronics]),
        Item(name: "Kindle", category: [.electronics]),
        Item(name: "Mouse", category: [.electronics]),
        Item(name: "Câmera", category: [.electronics]),
        Item(name: "Cartão de memória", category: [.electronics]),
        Item(name: "Tripé", category: [.electronics]),
        Item(name: "Relógio inteligente", category: [.electronics]),
        Item(name: "Caixa de som Bluetooth", category: [.electronics]),
        
        Item(name: "Escova de dentes", category: [.hygiene]),
        Item(name: "Pasta de dente", category: [.hygiene]),
        Item(name: "Fio dental", category: [.hygiene]),
        Item(name: "Enxaguante bucal", category: [.hygiene]),
        Item(name: "Sabonete", category: [.hygiene]),
        Item(name: "Shampoo", category: [.hygiene]),
        Item(name: "Condicionador", category: [.hygiene]),
        Item(name: "Desodorante", category: [.hygiene]),
        Item(name: "Perfume", category: [.hygiene]),
        Item(name: "Protetor solar", category: [.hygiene]),
        Item(name: "Repelente", category: [.hygiene]),
        Item(name: "Hidratante", category: [.hygiene]),
        Item(name: "Lâmina de barbear", category: [.hygiene]),
        Item(name: "Cotonetes", category: [.hygiene]),
        Item(name: "Lenços umedecidos", category: [.hygiene]),
        Item(name: "Toalha de banho", category: [.hygiene]),
        Item(name: "Toalha de rosto", category: [.hygiene]),
        
        Item(name: "Camisetas", category: [.clothes]),
        Item(name: "Camisas", category: [.clothes]),
        Item(name: "Calças", category: [.clothes]),
        Item(name: "Shorts", category: [.clothes]),
        Item(name: "Vestidos", category: [.clothes]),
        Item(name: "Saias", category: [.clothes]),
        Item(name: "Roupas íntimas", category: [.clothes]),
        Item(name: "Meias", category: [.clothes]),
        Item(name: "Pijamas", category: [.clothes]),
        Item(name: "Casacos", category: [.clothes]),
        Item(name: "Blusas de frio", category: [.clothes]),
        Item(name: "Suéteres", category: [.clothes]),
        Item(name: "Roupas de banho (biquíni, sunga, maiô)", category: [.clothes]),
        Item(name: "Roupas de academia", category: [.clothes]),
        
        Item(name: "Tênis", category: [.footwear]),
        Item(name: "Chinelo", category: [.footwear]),
        Item(name: "Sandália", category: [.footwear]),
        Item(name: "Sapato", category: [.footwear]),
        Item(name: "Bota", category: [.footwear]),
        Item(name: "Calçado para trilha", category: [.footwear]),
        Item(name: "Sapatilha", category: [.footwear]),
        
        Item(name: "Remédios pessoais", category: [.health]),
        Item(name: "Analgésicos", category: [.health]),
        Item(name: "Curativos", category: [.health]),
        Item(name: "Álcool em gel", category: [.health]),
        Item(name: "Termômetro", category: [.health]),
        Item(name: "Máscaras", category: [.health]),
        Item(name: "Antisséptico", category: [.health]),
        
        Item(name: "Óculos de sol", category: [.accessories]),
        Item(name: "Óculos de grau", category: [.accessories]),
        Item(name: "Lentes de contato", category: [.accessories]),
        Item(name: "Boné", category: [.accessories]),
        Item(name: "Chapéu", category: [.accessories]),
        Item(name: "Lenço", category: [.accessories]),
        Item(name: "Guarda-chuva", category: [.accessories]),
        Item(name: "Capa de chuva", category: [.accessories]),
        Item(name: "Cinto", category: [.accessories]),
        Item(name: "Relógio", category: [.accessories]),
        Item(name: "Bijuterias ou joias", category: [.accessories]),
        Item(name: "Carteira", category: [.accessories]),
        Item(name: "Documento de identidade", category: [.accessories]),
        Item(name: "Passaporte", category: [.accessories]),
        
        Item(name: "Livro", category: [.miscellaneous]),
        Item(name: "Garrafa de água", category: [.miscellaneous]),
        Item(name: "Lanche", category: [.miscellaneous]),
        Item(name: "Travesseiro de pescoço", category: [.miscellaneous]),
        Item(name: "Bagagem de mão", category: [.miscellaneous]),
        Item(name: "Caneta", category: [.miscellaneous]),
        Item(name: "Bloquinho de anotações", category: [.miscellaneous]),

        Item(name: "Barraca de camping", category: [.camping]),
        Item(name: "Saco de dormir", category: [.camping]),
        Item(name: "Lanterna de cabeça", category: [.camping]),
        Item(name: "Fogareiro portátil", category: [.camping]),
        Item(name: "Garrafa térmica", category: [.camping]),
        Item(name: "Canivete suíço", category: [.camping]),
        Item(name: "Repelente para insetos", category: [.camping]),

        Item(name: "Toalha de praia", category: [.beach]),
        Item(name: "Chinelo de dedos", category: [.beach]),
        Item(name: "Protetor solar", category: [.beach]),
        Item(name: "Óculos de sol", category: [.beach]),
        Item(name: "Canga", category: [.beach]),
        Item(name: "Bolsa de praia", category: [.beach]),
        Item(name: "Guarda-sol", category: [.beach]),

        Item(name: "Notebook", category: [.work]),
        Item(name: "Carregador de notebook", category: [.work]),
        Item(name: "Fones de ouvido com microfone", category: [.work]),
        Item(name: "Caderno de anotações", category: [.work]),
        Item(name: "Canetas", category: [.work]),
        Item(name: "Agenda", category: [.work]),
        Item(name: "Cartões de visita", category: [.work]),

        Item(name: "Ingresso do show", category: [.concert]),
        Item(name: "Pulseira de entrada", category: [.concert]),
        Item(name: "Jaqueta leve", category: [.concert]),
        Item(name: "Boné ou chapéu", category: [.concert]),
        Item(name: "Protetor auricular", category: [.concert]),
        Item(name: "Capa de chuva descartável", category: [.concert]),
        Item(name: "Garrafa de água reutilizável", category: [.concert]),

        Item(name: "Passaporte", category: [.international]),
        Item(name: "Visto de entrada", category: [.international]),
        Item(name: "Cartão de embarque", category: [.international]),
        Item(name: "Adaptador universal de tomada", category: [.international]),
        Item(name: "Carteira de vacinas", category: [.international]),
        Item(name: "Seguro viagem", category: [.international]),
        Item(name: "Guia de conversação", category: [.international]),

        Item(name: "Baralho de cartas", category: [.others]),
        Item(name: "Jogo de tabuleiro de viagem", category: [.others]),
        Item(name: "Carregador portátil solar", category: [.others]),
        Item(name: "Travesseiro inflável", category: [.others]),
        Item(name: "Lanterna portátil", category: [.others]),
        Item(name: "Bolsa organizadora", category: [.others]),
        Item(name: "Saco estanque", category: [.others]),
    ]
}



