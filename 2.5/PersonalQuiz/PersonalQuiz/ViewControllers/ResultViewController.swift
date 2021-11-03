//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Nikita Zharinov on 01/11/2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var animalTypeLabel: UILabel!
    @IBOutlet weak var anymalTypeDefinitionLabel: UILabel!

    public var answerChosen:[Answer]?

    private var mostPopularAnimalType: AnimalType?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectMostPopularAnimalType()
        updateUI()
    }    
}

// MARK: - Private Methods
private extension ResultViewController {
    
    func updateUI() {
        guard let userAnymalType = mostPopularAnimalType else { return }
        
        self.navigationItem.hidesBackButton = true
        
        animalTypeLabel.text = "\(userAnymalType) - " + String(userAnymalType.rawValue)
        anymalTypeDefinitionLabel.text = String(userAnymalType.definition)
    }
    
    func selectMostPopularAnimalType() {
        guard let safeAnswerChosen = answerChosen else { return }
        
        let chosenAnimalTypeArray = safeAnswerChosen.map { $0.type }
        var frequency = [AnimalType: Int]()
        
        chosenAnimalTypeArray.forEach { frequency[$0] = (frequency[$0] ?? 0) + 1 }

        if let (type, _) = frequency.max(by: {$0.1 < $1.1}) {
            mostPopularAnimalType = type
        }
    }
}
