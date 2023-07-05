//
//  GridCollectionViewCell.swift
//  SteamStore
//
//  Created by MacBook Pro on 2/07/23.
//

import UIKit
import SDWebImage

class GridCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nombreTxt: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func setup (with valor: Juego){
        imageView.sd_setImage(with: URL(string: valor.imagenURL), completed: nil)
        nombreTxt.text = valor.nombre
    }
}
