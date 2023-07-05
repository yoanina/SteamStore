//
//  ListaJuegosViewController.swift
//  SteamStore
//
//  Created by MacBook Pro on 2/07/23.
//

import UIKit

class ListaJuegosViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var grid: UICollectionView!
    
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
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
}
