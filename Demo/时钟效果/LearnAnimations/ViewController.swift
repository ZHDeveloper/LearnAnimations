//
//  ViewController.swift
//  LearnAnimations
//
//  Created by ZhiHua Shen on 2017/7/14.
//  Copyright © 2017年 ZhiHua Shen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var clockView: UIImageView!
    
    var secondsLayer: CALayer!
    var hoursLayer: CALayer!
    var minutesLayer: CALayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildUI()
        
        updateClock()

        /// 开启定时器
        let timer = Timer(timeInterval: 1, target: self, selector: #selector(updateClock), userInfo: nil, repeats: true)
        RunLoop.main.add(timer, forMode: .commonModes)
    }
    
    func buildUI() {
        
        hoursLayer = CALayer()
        view.layer.addSublayer(hoursLayer)
        hoursLayer.contentsScale = 5
        hoursLayer.backgroundColor = UIColor.black.cgColor
        hoursLayer.bounds = CGRect(x: 0, y: 0, width: 5, height: 65)
        hoursLayer.position = view.center
        hoursLayer.anchorPoint = CGPoint(x: 0.5, y: 0.85)
        
        minutesLayer = CALayer()
        view.layer.addSublayer(minutesLayer)
        minutesLayer.contentsScale = 5
        minutesLayer.backgroundColor = UIColor.black.cgColor
        minutesLayer.bounds = CGRect(x: 0, y: 0, width: 3, height: 75)
        minutesLayer.position = view.center
        minutesLayer.anchorPoint = CGPoint(x: 0.5, y: 0.80)
        
        secondsLayer = CALayer()
        secondsLayer.contentsScale = 5
        view.layer.addSublayer(secondsLayer)
        secondsLayer.backgroundColor = UIColor.red.cgColor
        secondsLayer.bounds = CGRect(x: 0, y: 0, width: 2, height: 90)
        secondsLayer.position = view.center
        secondsLayer.anchorPoint = CGPoint(x: 0.5, y: 0.75)
        
        let circleLayer = CALayer()
        view.layer.addSublayer(circleLayer)
        circleLayer.bounds = CGRect(x: 0, y: 0, width: 10, height: 10)
        circleLayer.backgroundColor = UIColor.red.cgColor
        circleLayer.cornerRadius = 5
        circleLayer.position = view.center
    }
    
    @objc func updateClock() {
        
        let calendar = Calendar.current
        let cmp = calendar.dateComponents([.hour,.minute,.second], from: Date())
        
        let hourAngle = (Float(abs(cmp.hour! - 12)) * 30.0 + 30 * (Float(cmp.minute!)/60.0)) * .pi
        
        hoursLayer.transform = CATransform3DMakeRotation(CGFloat(hourAngle / 180.0), 0, 0, 1)
        minutesLayer.transform = CATransform3DMakeRotation(CGFloat(Float(cmp.minute!) * 6.0 * .pi / 180.0), 0, 0, 1)
        secondsLayer.transform = CATransform3DMakeRotation(CGFloat(Float(cmp.second!) * 6.0 * .pi / 180.0), 0, 0, 1)
    }
    
}

