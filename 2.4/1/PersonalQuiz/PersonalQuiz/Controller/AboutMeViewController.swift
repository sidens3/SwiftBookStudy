//
//  AboutMeViewController.swift
//  PersonalQuiz
//
//  Created by Михаил Зиновьев on 31.10.2021.
//

import UIKit

class AboutMeViewController: UIViewController {
    
    var aboutMeInfo: PersonalData?

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
