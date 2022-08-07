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
        setupButton(with: nextAnimation.preset)
    }
    
    //MARK: Private methods
    private func getNextAnimation() -> NextAnimation {
        NextAnimation(
            preset: animations.randomElement()?.rawValue ?? "pop",
            curve: animationCurves.randomElement()?.rawValue ?? "easeIn",
            force: Float.random(in: 0.7...2),
            duration: Float.random(in: 0.5...1.2),
            delay: Float.random(in: 0.5...1.2)
        )
    }
    
    private func setupButton(with title: String) {
        actionButton.configuration?.title = title
    }
    
    private func setupParametersText(with nextAnimation: NextAnimation) {
        parametersTextView.text = """
Preset: \(nextAnimation.preset)
Curve: \(nextAnimation.curve)
\(String(format: "Force: %.2f", nextAnimation.force))
\(String(format: "Duration: %.2f", nextAnimation.duration))
\(String(format: "Delay: %.2f", nextAnimation.delay))
"""
    }
    
    private func startSpringAnimation(with parameters: NextAnimation) {
        animationSpringView.animation = parameters.preset
        animationSpringView.curve = parameters.curve
        animationSpringView.force = CGFloat(parameters.force)
        animationSpringView.duration = CGFloat(parameters.duration)
        animationSpringView.delay = CGFloat(parameters.delay)
        animationSpringView.animate()
    }
}

