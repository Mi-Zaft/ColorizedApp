//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Максим Евграфов on 18.05.2023.
//

import UIKit

class PaletteViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var colorizedView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    var redColor = 1.0
    var greenColor = 1.0
    var blueColor = 1.0
    
    var delegate: PaletteViewControllerDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorizedView.layer.cornerRadius = 10
        print(greenColor)
        setupValues()
        setupPreviewColor()
    }
    
    // MARK: - IBActions
    @IBAction func sliderMoved(_ sender: UISlider) {
        setupPreviewColor()
        
        switch sender {
        case redSlider:
            redValueLabel.text = string(from: redSlider)
        case greenSlider:
            greenValueLabel.text = string(from: greenSlider)
        default:
            blueValueLabel.text = string(from: blueSlider)
        }
    }
    
    @IBAction func buttonDoneDidTapped() {
        delegate.setBackgroundColor(
            red: redSlider.value,
            green: greenSlider.value,
            blue: blueSlider.value
        )
        dismiss(animated: true)
    }
}

// MARK: - Private Methods
private extension PaletteViewController {
    func setupPreviewColor() {
        colorizedView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: CGFloat(1)
        )
    }
    
    func setupValues() {
        redSlider.value = Float(redColor)
        greenSlider.value = Float(greenColor)
        blueSlider.value = Float(blueColor)
        
        redValueLabel.text = string(from: redSlider)
        greenValueLabel.text = string(from: greenSlider)
        blueValueLabel.text = string(from: blueSlider)
    }
    
    func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}
