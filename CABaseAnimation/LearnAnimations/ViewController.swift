//
//  ViewController.swift
//  LearnAnimations
//
//  Created by ZhiHua Shen on 2017/7/14.
//  Copyright © 2017年 ZhiHua Shen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
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
        
        colorView.layer.add(groupAnimations, forKey: nil)
    }
    
}

