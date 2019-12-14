//
//  ViewController.swift
//  CollectionViewPractice
//
//  Created by Applica on 13/12/2019.
//  Copyright © 2019 Applica. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    //numberOfItemsInSection - Cantidad de items
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 500
    }
    
//función cellForItemAt - Crea una celda, la edita y retorna
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "colorCell", for: indexPath)
        
        let red = CGFloat(Int(arc4random_uniform(155)) + 100)
        let blue = CGFloat(Int(arc4random_uniform(155)) + 100)
        let green = CGFloat(Int(arc4random_uniform(155)) + 100)
        
        cell.backgroundColor = UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionVew(collection: collectionView)
    }

    @IBOutlet weak var collectionView: UICollectionView!
    
    //Delega los protocolos de UICollectionView a este ViewController.
    func setUpCollectionVew(collection: UICollectionView){
        collection.delegate = self
        collection.dataSource = self
    }
    
//Función sizeForItemAt indexPath CAMBIA EL TAMAÑO de las celdas (width y height)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//Se crea una variable con el tamaño de la Pantalla
        let screenSize = UIScreen.main.bounds
//Se crea variable del tamaño del ancho de la pantalla en 3 y un poco más pequeña
        let widthValue = (screenSize.width / 4.0) * 0.8
        //Retorna un objeto CGSize
        return CGSize(width: widthValue, height: widthValue)
    }
    
//minimumLineSpacingForSectionAt - Cambia el espaciado minimo
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    
//minimumInteritemSpacingForSectionAt
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        5.0
    }
    
// insetForSectionAt - AGREGA BORDES a toda la sección
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}

