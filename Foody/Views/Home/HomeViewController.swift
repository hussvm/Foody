//
//  HomeViewController.swift
//  Foody
//
//  Created by HUSSAM on 5/30/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    @IBOutlet weak var specailsCollectionView: UICollectionView!
    
    var categories: [DishCategory] = [
        .init(id: "id1", name: "Gorasa 1", image: "https://picsum.photos/100/200"),
        .init(id: "id2", name: "Gorasa 2", image: "https://picsum.photos/100/200"),
        .init(id: "id3", name: "Gorasa 3", image: "https://picsum.photos/100/200"),
        .init(id: "id4", name: "Gorasa 4", image: "https://picsum.photos/100/200"),
        .init(id: "id5", name: "Gorasa 5", image: "https://picsum.photos/100/200")
    ]
    
    var populars: [Dish] = [
        .init(id: "id1", name: "Pizza1", image: "https://picsum.photos/100/200", description: "The Best Food Ever !", calories: 20),
        .init(id: "id1", name: "Pizza2", image: "https://picsum.photos/100/200", description: "The Best Food Ever !", calories: 200),
        .init(id: "id1", name: "Pizza3", image: "https://picsum.photos/100/200", description: "The Best Food Ever !", calories: 2000),
    ]
    
    var specails: [Dish] = [
        .init(id: "id1", name: "Pizza1", image: "https://picsum.photos/100/200", description: "The Best Food Ever !", calories: 20),
        .init(id: "id1", name: "Pizza2", image: "https://picsum.photos/100/200", description: "The Best Food Ever !", calories: 200)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        
    }
    
    private func registerCells() {
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier , bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        popularCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.identifier , bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
        
        specailsCollectionView.register(UINib(nibName: DishLandScapeCollectionViewCell.identifier , bundle: nil), forCellWithReuseIdentifier: DishLandScapeCollectionViewCell.identifier)
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
            
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return populars.count
        case specailsCollectionView:
            return specails.count
        default: return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
            
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifier, for: indexPath) as! DishPortraitCollectionViewCell
            cell.setup(dish: populars[indexPath.row])
            return cell
            
        case specailsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishLandScapeCollectionViewCell.identifier, for: indexPath) as! DishLandScapeCollectionViewCell
            cell.setup(dish: specails[indexPath.row])
            return cell
            
        default: return UICollectionViewCell()
            
        }
    }
}
