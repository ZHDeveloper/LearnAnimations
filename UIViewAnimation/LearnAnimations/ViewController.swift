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

    }
    
    /// UIView的转场动画
    func test1() {
        
        if colorView.isHidden {
            UIView.transition(with: colorView, duration: 0.5, options: [.transitionCurlDown,.curveEaseIn], animations: {
                self.colorView.isHidden = false
            })
        }
        else {
            UIView.transition(with: colorView, duration: 0.5, options: [.transitionCurlUp,.curveEaseIn], animations: {
                self.colorView.isHidden = true
            })
        }
    }
    
    /// UIView的关键帧动画
    func test2() {
        UIView.animateKeyframes(withDuration: 2, delay: 0, options: .repeat, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                self.colorView.alpha = 0
            })
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
                self.colorView.alpha = 1
            })
        })
    }
    
    func test3() {
        UIView.beginAnimations("animation", context: nil)
        UIView.setAnimationDuration(3)
        UIView.setAnimationWillStart(#selector(animationWillStart))
        /// 这里需要设置代理对象，代理方法才会调用
        UIView.setAnimationDelegate(self)
        if self.colorView.alpha == 0 {
            self.colorView.alpha = 1
        }
        else {
            self.colorView.alpha = 0
        }
        UIView.commitAnimations()
    }
    
    @objc func animationWillStart() {
        print(#function)
        print(#line)
    }
}

