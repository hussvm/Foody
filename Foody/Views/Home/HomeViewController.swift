//
//  HomeViewController.swift
//  Foody
//
//  Created by HUSSAM on 5/30/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var categories: [DishCategory] = [
        .init(id: "id1", name: "Gorasa", image: "https://picsum.photos/100/200"),
        .init(id: "id2", name: "Aseda", image: "https://picsum.photos/100/200"),
        .init(id: "id3", name: "Pizza", image: "https://picsum.photos/100/200"),
        .init(id: "id4", name: "Samboksa", image: "https://picsum.photos/100/200"),
        .init(id: "id5", name: "T3mia", image: "https://picsum.photos/100/200")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        
    }
    
    private func registerCells() {
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier , bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
        cell.setup(category: categories[indexPath.row])
        return cell
    }
}
