//
//  MoreInfoViewController.swift
//  PersonalQuiz
//
//  Created by Михаил Зиновьев on 31.10.2021.
//

import UIKit

class MoreInfoViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var secondNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var profession: UILabel!
    @IBOutlet weak var favoritePet: UILabel!
    @IBOutlet weak var smileCatImageView: UIImageView!
    
    var userInfo: PersonalData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }

    private func configure() {
        smileCatImageView.layer.cornerRadius = smileCatImageView.frame.height / 2
        
        nameLabel.text = "Name: \(userInfo?.name ?? .empty)"
        secondNameLabel.text = "Second name: \(userInfo?.secondName ?? .empty)"
        ageLabel.text = "Age: \(userInfo?.age.description ?? .empty) y.o."
        profession.text = "Profession: \(userInfo?.profession ?? .empty)"
        favoritePet.text = "Favorite pet: \(userInfo?.favoritePet ?? .empty) "
        
        self.navigationItem.title = "More"
    }
}
