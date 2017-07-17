//
//  ViewController.swift
//  LearnAnimations
//
//  Created by ZhiHua Shen on 2017/7/14.
//  Copyright © 2017年 ZhiHua Shen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var redLayer: CALayer = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redLayer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        redLayer.position = view.center
        redLayer.backgroundColor = UIColor.red.cgColor
        
        view.layer.addSublayer(redLayer)
        
        print(redLayer.position)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        CATransaction.begin()
        CATransaction.setAnimationDuration(2)
        redLayer.cornerRadius = 50
        redLayer.position = CGPoint(x: 300, y: 300)
        CATransaction.commit()
    }
    
}

