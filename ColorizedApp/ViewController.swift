//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Максим Евграфов on 18.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var colorizedView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorizedView.layer.cornerRadius = 10
        sliderMoved()
    }
    
    // MARK: - IBActions
    @IBAction func sliderMoved() {
        redValueLabel.text = String(round(redSlider.value * 100) / 100)
        greenValueLabel.text = String(round(greenSlider.value * 100) / 100)
        blueValueLabel.text = String(round(blueSlider.value * 100) / 100)
        
        colorizedView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: CGFloat(1)
        )
    }


}

