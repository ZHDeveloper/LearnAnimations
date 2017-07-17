//
//  ViewController.swift
//  LearnAnimations
//
//  Created by ZhiHua Shen on 2017/7/14.
//  Copyright © 2017年 ZhiHua Shen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        let animation = CATransition()
        animation.duration = 0.5
        animation.type = kCATransitionFade
        imageView.layer.add(animation, forKey: nil)
        
        let name = arc4random_uniform(3) + 1
        imageView.image = UIImage(named: "\(name)")
    }
    
}

