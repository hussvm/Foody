//
//  DishDetailViewController.swift
//  Foody
//
//  Created by HUSSAM on 6/5/23.
//

import UIKit
import ProgressHUD

class DishDetailViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    
    var dish: Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateView()
    }
    
    private func populateView () {
//        dishImageView.kf.setImage(with: dish.image?.asURL)
        dishImageView.image = UIImage(named: "foo")
        titleLabel.text = dish.name
        descriptionLabel.text = dish.description
        caloriesLabel.text = dish.formattedCalories
    }
    
    @IBAction func orderButtonClicked(_ sender: UIButton) {
        guard let name = nameField.text?.trimmingCharacters(in: .whitespaces), !name.isEmpty else {
            ProgressHUD.showError("Place Enter Your Name")
            return
        }
        
        /*  ProgressHUD.show("Placing Order ...")
        
        NetworkService.shared.placeOrder(dishId: dish.id ?? "", name: name) {(result) in
            switch result {
            case .success(_):
                ProgressHUD.show("Your Order Has Been Recived")
            case .failure(let error):
                print("The Error is :\n\(error.localizedDescription)")
            }
        }*/
    }
}
