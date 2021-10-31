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
    var userInfo: PersonalData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }

    private func configure() {
        nameLabel.text = userInfo?.name
        secondNameLabel.text = userInfo?.secondName
        ageLabel.text = userInfo?.age.description
        profession.text = userInfo?.profession
        favoritePet.text = userInfo?.favoritePet
        
        self.navigationItem.title = "More"
    }
}
