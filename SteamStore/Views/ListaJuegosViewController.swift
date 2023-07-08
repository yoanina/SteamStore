//
//  ListaJuegosViewController.swift
//  SteamStore
//
//  Created by MacBook Pro on 2/07/23.
//

import UIKit
import FirebaseDatabase

class ListaJuegosViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var grid: UICollectionView!
    var valores:[Juego] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        grid.dataSource = self
        grid.delegate = self
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        
        grid.collectionViewLayout = layout
        
        Database.database().reference().child("juegos").observe(DataEventType.childAdded, with: { (snapshot) in
            let juego = Juego()
            juego.id = snapshot.key
            juego.nombre = (snapshot.value as! NSDictionary)["nombre"] as! String
            juego.imagenURL = (snapshot.value as! NSDictionary)["imagenURL"] as! String
            juego.imagenID = (snapshot.value as! NSDictionary)["imagenID"] as! String
            juego.descripcion = (snapshot.value as! NSDictionary)["descripcion"] as! String
            juego.categorias = (snapshot.value as! NSDictionary)["categorias"] as! String
            juego.almacenamiento = (snapshot.value as! NSDictionary)["almacenamiento"] as! String
            juego.precio = (snapshot.value as! NSDictionary)["precio"] as! String
            juego.desarrolladora = (snapshot.value as! NSDictionary)["desarrolladora"] as! String
            self.valores.append(juego)
            self.grid.reloadData()
        })
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return valores.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =
        grid.dequeueReusableCell(withReuseIdentifier: "GridCollectionViewCell", for: indexPath) as! GridCollectionViewCell
        cell.setup(with: valores[indexPath.row])
        return cell
    }
}
