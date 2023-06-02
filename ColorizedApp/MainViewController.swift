//
//  MainViewController.swift
//  ColorizedApp
//
//  Created by Максим Евграфов on 31.05.2023.
//

import UIKit

protocol PaletteViewControllerDelegate {
    func setBackgroundColor(red: Float, green: Float, blue: Float)
}

class MainViewController: UIViewController {
    
    var redColor = 1.0
    var greenColor = 1.0
    var blueColor = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let paletteVC = segue.destination as? PaletteViewController {
            
            guard let backgroundColor = view.backgroundColor else { return }
            guard let components = backgroundColor.cgColor.components else { return }
             
            paletteVC.delegate = self
            
            paletteVC.redColor = components[0]
            paletteVC.greenColor = components[1]
            paletteVC.blueColor = components[2]
            
        } else { return }
    }
}

// MARK: - Private Methods
private extension MainViewController {
    func setupUI() {
        view.backgroundColor = UIColor(
            red: redColor,
            green: greenColor,
            blue: blueColor,
            alpha: 1
        )
    }
}

// MARK: - PaletteViewControllerDelegate
extension MainViewController: PaletteViewControllerDelegate {
    func setBackgroundColor(red: Float, green: Float, blue: Float) {
        view.backgroundColor = UIColor(
            red: CGFloat(red),
            green: CGFloat(green),
            blue: CGFloat(blue),
            alpha: 1
        )
    }
}
