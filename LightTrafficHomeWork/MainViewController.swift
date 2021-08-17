//
//  MainViewController.swift
//  LightTrafficHomeWork
//
//  Created by Nadzeya Shpakouskaya on 17/08/2021.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var redSignView: UIView!
    @IBOutlet weak var yellowSignView: UIView!
    @IBOutlet weak var greenSignView: UIView!
    
    @IBOutlet weak var actionButton: UIButton!
    
    // MARK: - Private properties
    private var currentColorSign: SignColor?
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUIElements()
    }
    
    // MARK: - IBActions
    @IBAction func actionButtonPressed() {
        actionButton.setTitle("Next", for: .normal)
        changeSignColor()
    }
    
    // MARK: - Private methods
    fileprivate func setUpUIElements() {
        redSignView.layer.cornerRadius = redSignView.frame.size.height / 2
        yellowSignView.layer.cornerRadius = yellowSignView.frame.size.height / 2
        greenSignView.layer.cornerRadius = greenSignView.frame.size.height / 2
        
        actionButton.layer.cornerRadius = 15
    }
    
    fileprivate func changeSignColor(){
        switch currentColorSign {
        case .red:
            redSignView.layer.opacity = 0.35
            yellowSignView.layer.opacity = 1
            currentColorSign = .yellow
        case .yellow:
            yellowSignView.layer.opacity = 0.35
            greenSignView.layer.opacity = 1
            currentColorSign = .green
        case .green:
            redSignView.layer.opacity = 1
            greenSignView.layer.opacity = 0.35
            currentColorSign = .red
        case .none:
            redSignView.layer.opacity = 1
            currentColorSign = .red
        }
    }
}

extension MainViewController {
    enum SignColor {
        case red, yellow, green
    }
}
