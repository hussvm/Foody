//
//  ListDishesViewController.swift
//  Foody
//
//  Created by HUSSAM on 6/7/23.
//

import UIKit

class ListDishesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var category: DishCategory!
    
    var dishes: [Dish] = [
        .init(id: "id1", name: "Pizza1", image: "https://picsum.photos/100/200", description: "The Best Food Ever !", calories: 20),
        .init(id: "id1", name: "Pizza2", image: "https://picsum.photos/100/200", description: "The Best Food Ever !", calories: 200),
        .init(id: "id1", name: "Pizza3", image: "https://picsum.photos/100/200", description: "The Best Food Ever ! ", calories: 2000),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = category.name
        registerCells()
        
    }
    
    private func registerCells()
    {
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
    
}

extension ListDishesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        cell.setup(dish: dishes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}
