//
//  Juego.swift
//  SteamStore
//
//  Created by MacBook Pro on 2/07/23.
//

import Foundation
struct Juego:Decodable{
    let id:Int
    let nombre:String
    let descripcion:String
    let precio:Double
    let imagenURL:String
    let imagenID:String
    let categorias:String
    let almacenamiento:String
    let desarrolladora:String
}
