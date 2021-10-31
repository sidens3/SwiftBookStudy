//
//  AboutMeViewController.swift
//  PersonalQuiz
//
//  Created by Михаил Зиновьев on 31.10.2021.
//

import UIKit

class AboutMeViewController: UIViewController {
    
    @IBOutlet weak var aboutMeLabel: UILabel!
    var aboutMeInfo: PersonalData?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        aboutMeLabel.text = "Hi! \n I'm \(aboutMeInfo?.name ?? .empty) \(aboutMeInfo?.secondName ?? .empty). \n If you want to know more about me touch \"More button\", please!"
    }
    
    @IBAction func moreInfoButtonPressed() {
        self.performSegue(withIdentifier: "showMoreInfo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMoreInfo" {
            guard let moreInfoViewController = segue.destination as? MoreInfoViewController else { return }
            
            moreInfoViewController.userInfo = aboutMeInfo
        }
    }
}
