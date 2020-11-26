//
//  CustomButtons.swift
//  Micro Beat Machine
//
//  Created by Дмитрий Подольский on 26.11.2020.
//
//copied from https://itnan.ru/post.php?c=1&p=418989 and modified
//

import Foundation
import UIKit

class CustomButton1: UIButton {

    var color: UIColor = .black
    let touchDownAlpha: CGFloat = 0.3
    let timerStep: TimeInterval = 0.01
    let animateTime: TimeInterval = 0.4
    
    func setup() {
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.white.cgColor
        
        backgroundColor = .clear
        layer.backgroundColor = color.cgColor

        layer.cornerRadius = 6
        clipsToBounds = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        if let backgroundColor = backgroundColor {
            color = backgroundColor
        }

        setup()
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                touchDown()
            } else {
                cancelTracking(with: nil)
                touchUp()
            }
        }
    }

    func touchDown() {
        stopTimer()

        layer.backgroundColor = color.withAlphaComponent(touchDownAlpha).cgColor
    }

    lazy var alphaStep: CGFloat = {
        return (1 - touchDownAlpha) / CGFloat(animateTime / timerStep)
    }()

    func touchUp() {
        timer = Timer.scheduledTimer(timeInterval: timerStep,
                                     target: self,
                                     selector: #selector(animation),
                                     userInfo: nil,
                                     repeats: true)
    }

    @objc func animation() {
        guard let backgroundAlpha = layer.backgroundColor?.alpha else {
            stopTimer()

            return
        }

        let newAlpha = backgroundAlpha + alphaStep

        if newAlpha < 1 {
            layer.backgroundColor = color.withAlphaComponent(newAlpha).cgColor
        } else {
            layer.backgroundColor = color.cgColor

            stopTimer()
        }
    }

    weak var timer: Timer?

    func stopTimer() {
        timer?.invalidate()
    }

    deinit {
        stopTimer()
    }
}
