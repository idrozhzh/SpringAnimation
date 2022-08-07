//
//  SpringAnimationViewController.swift
//  SpringAnimationHW
//
//  Created by Иван Дрожжин on 06.08.2022.
//

import UIKit
import SpringAnimation

class SpringAnimationViewController: UIViewController {
    
    @IBOutlet weak var animationSpringView: SpringView!
    @IBOutlet weak var parametersTextView: UITextView!
    @IBOutlet weak var actionButton: UIButton!
    
    let animations = AnimationPreset.allCases
    let animationCurves = AnimationCurve.allCases
    
    lazy var nextAnimation = getNextAnimation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationSpringView.layer.cornerRadius = 10
        actionButton.layer.cornerRadius = 5
        
        animationSpringView.isHidden = true
        
        nextAnimation = getNextAnimation()
        setupButton(with: "Run")
    }
    
    @IBAction func startTheAnimation() {
        if animationSpringView.isHidden {
            animationSpringView.isHidden.toggle()
        }
        
        setupParametersText(with: nextAnimation)
        startSpringAnimation(with: nextAnimation)
        
        nextAnimation = getNextAnimation()
        setupButton(with: getTextForButton(from: nextAnimation))
    }
    
    //MARK: Private methods
    private func getNextAnimation() -> NextAnimation {
        NextAnimation(
            preset: animations.randomElement() ?? .pop,
            curve: animationCurves.randomElement() ?? .easeIn,
            force: CGFloat.random(in: 0...2),
            duration: CGFloat.random(in: 0...1.2),
            delay: CGFloat.random(in: 0...1.2)
        )
    }
    
    private func setupButton(with title: String) {
        actionButton.configuration?.title = title
    }
    
    private func setupParametersText(with nextAnimation: NextAnimation) {
        parametersTextView.text = """
Preset: \(nextAnimation.preset.rawValue)
Curve: \(nextAnimation.curve.rawValue)
\(String(format: "Force: %.2f", nextAnimation.force))
\(String(format: "Duration: %.2f", nextAnimation.duration))
\(String(format: "Delay: %.2f", nextAnimation.delay))
"""
    }
    
    private func getTextForButton(from nextAnimation: NextAnimation) -> String {
        "Run \(nextAnimation.preset.rawValue)"
    }
    
    private func startSpringAnimation(with parameters: NextAnimation) {
        animationSpringView.animation = parameters.preset.rawValue
        animationSpringView.curve = parameters.curve.rawValue
        animationSpringView.force = parameters.force
        animationSpringView.duration = parameters.duration
        animationSpringView.delay = parameters.delay
        animationSpringView.animate()
    }
}

