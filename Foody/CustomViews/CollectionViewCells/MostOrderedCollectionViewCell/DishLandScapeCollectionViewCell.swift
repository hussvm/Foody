//
//  DishLandScapeCollectionViewCell.swift
//  Foody
//
//  Created by HUSSAM on 6/2/23.
//

import UIKit

class DishLandScapeCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: DishLandScapeCollectionViewCell.self)
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    
    func setup(dish: Dish) {
        titleLabel.text = dish.name
        dishImageView.kf.setImage(with: dish.image?.asURL)
        caloriesLabel.text = dish.formattedCalories
        descriptionLabel.text = dish.description
    }
}
