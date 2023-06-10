//
//  ListOrdersViewController.swift
//  Foody
//
//  Created by HUSSAM on 6/8/23.
//

import UIKit

class ListOrdersViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var orders: [Order] = [
        .init(id: "id1", name: "Hussam", dish: .init(id: "id1", name: "Pizza", image: "1", description: "The Best Food Ever !", calories: 200)),
        .init(id: "id1", name: "KAZ", dish: .init(id: "id1", name: "Gorssa", image: "h2", description: "The Best Food Ever !", calories: 250)),
        .init(id: "id1", name: "ALi", dish: .init(id: "id1", name: "Kebda", image: "3", description: "The Best Food Ever !", calories: 300))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Orders"
        registerCells()
        
    }
    
    private func registerCells()
    {
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
}
extension ListOrdersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        cell.setup(order: orders[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
    
}

