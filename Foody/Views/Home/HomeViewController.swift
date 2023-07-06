//
//  HomeViewController.swift
//  Foody
//
//  Created by HUSSAM on 5/30/23.
//

import UIKit
import ProgressHUD

class HomeViewController: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var specailsCollectionView: UICollectionView!
    
    var categories: [DishCategory] = [
        .init(id: "id1", name: "Snacks", image: "1"),
        .init(id: "id2", name: "Grills", image: "1"),
        .init(id: "id3", name: "Pizza", image: "1"),
        .init(id: "id4", name: "Sudane", image: "1"),
        .init(id: "id4", name: "Sea Food", image: "1"),
        .init(id: "id5", name: "Vegetarian", image: "1")
    ]
    
    var populars: [Dish] = [
        .init(id: "id1", name: "Pizza", image: "1", description: "The Best Food Ever !", calories: 200),
        .init(id: "id1", name: "Gorssa", image: "1", description: "The Best Food Ever !", calories: 250),
        .init(id: "id1", name: "Kebda", image: "1", description: "The Best Food Ever ! ", calories: 300),
    ]
    
    var specails: [Dish] = [
        .init(id: "id1", name: "Pizza Lover", image: "1", description: "The Best Food Ever !", calories: 200),
        .init(id: "id1", name: "Shyaa Lover", image: "1", description: "The Best Food Ever !", calories: 300),
        .init(id: "id1", name: "Grilled Chicken", image: "1", description: "The Best Food Ever !", calories: 450)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        
       /* NetworkService.shared.fetchAllCatgories { [weak self]
            Result in
            switch Result{
                
            case .success(let allDishes):
                ProgressHUD.dismiss()
                self?.categories = allDishes.catgories ?? []
                self?.populars = allDishes.populars ?? []
                self?.specails = allDishes.specials ?? []
                
                self?.categoryCollectionView.reloadData()
                self?.popularCollectionView.reloadData()
                self?.popularCollectionView.reloadData()
                
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }*/
        
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            let controller = ListDishesViewController.instantiate()
            controller.category = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
            
        } else {
            let controller = DishDetailViewController.instantiate()
            controller.dish = collectionView == popularCollectionView ? populars[indexPath.row] : specails[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
