//
//  ViewController.swift
//  Lights
//
//  Created by Михаил Зиновьев on 19.10.2021.
//

import UIKit

private enum Constants {
    static let startButtonFirstLabel = "START"
    static let startButtonTappedLabel = "NEXT"
    static let startButtonCornerRadius: CGFloat = 8.0
    static let enabledLightAlpha: CGFloat = 1
    static let disabledLightAlpha: CGFloat = 0.3
}

class LightsViewController: UIViewController {
    @IBOutlet weak var redLightView: UIView!
    @IBOutlet weak var greenLightView: UIView!
    @IBOutlet weak var startButton: UIButton!
    
    private var greenColorEnable: Bool?
    
    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redLightView.backgroundColor = .red
        redLightView.alpha = Constants.disabledLightAlpha
        redLightView.layer.cornerRadius = redLightView.frame.size.width/2
        
        greenLightView.backgroundColor = .green
        greenLightView.alpha = Constants.disabledLightAlpha
        greenLightView.layer.cornerRadius = greenLightView.frame.size.width/2
        
        startButton.setTitle(Constants.startButtonFirstLabel, for: .normal)
        startButton.layer.cornerRadius = Constants.startButtonCornerRadius
    }
    
    // MARK: - Actions
    @IBAction func buttonPressed(_ sender: UIButton) {
        guard let greenColorEnable = greenColorEnable else {
            self.greenColorEnable = true
            startButton.setTitle(Constants.startButtonTappedLabel, for: .normal)
            greenLightView.alpha = Constants.enabledLightAlpha
            return
        }

        self.greenColorEnable?.toggle()
        
        if greenColorEnable {
            redLightView.alpha = Constants.enabledLightAlpha
            greenLightView.alpha = Constants.disabledLightAlpha
        } else {
            redLightView.alpha = Constants.disabledLightAlpha
            greenLightView.alpha = Constants.enabledLightAlpha
        }
    }
}

