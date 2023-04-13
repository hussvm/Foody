//
//  OnboardingCollectionViewCell.swift
//  Foody
//
//  Created by HUSSAM on 4/13/23.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideDescrptionLabel: UILabel!
    
    func setup(slide: OnboardingSlide){
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescrptionLabel.text = slide.descrption
    }
}
