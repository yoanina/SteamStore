//
//  ListaJuegosViewController.swift
//  SteamStore
//
//  Created by MacBook Pro on 2/07/23.
//

import UIKit

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
