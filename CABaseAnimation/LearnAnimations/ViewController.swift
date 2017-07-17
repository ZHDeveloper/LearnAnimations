//
//  ViewController.swift
//  LearnAnimations
//
//  Created by ZhiHua Shen on 2017/7/14.
//  Copyright © 2017年 ZhiHua Shen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heartView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let animation = CABasicAnimation()
        animation.keyPath = "transform.scale"
        animation.toValue = 0
        animation.duration = 0.5
        animation.repeatCount = HUGE
        animation.autoreverses = true
        heartView.layer.add(animation, forKey: nil)
        
    }
    
    func test1() {
        let animation1 = CABasicAnimation()
        animation1.keyPath = "position"
        animation1.byValue = CGPoint(x: 10, y: 10)
        
        let animation2 = CABasicAnimation()
        animation2.keyPath = "transform.rotation.y"
        animation2.byValue = Double.pi * 0.25
        
        let groupAnimations = CAAnimationGroup()
        groupAnimations.animations = [animation1,animation2]
        
        groupAnimations.isRemovedOnCompletion = false
        groupAnimations.fillMode = kCAFillModeForwards
        
        heartView.layer.add(groupAnimations, forKey: nil)
    }
    
}

