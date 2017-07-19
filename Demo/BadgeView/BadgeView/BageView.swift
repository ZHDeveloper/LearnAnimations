//
//  BageView.swift
//  BadgeView
//
//  Created by ZhiHua Shen on 2017/7/19.
//  Copyright © 2017年 ZhiHua Shen. All rights reserved.
//

import UIKit

class BageView: UIView {
    
    var maxDistance: CGFloat = 60
    
    var smallView: UIView!
    
    var bageLabel: UILabel!
    
    var panGest: UIPanGestureRecognizer!
    
    var distanceToBageLabel: CGFloat {
        let x = bageLabel.center.x - smallView.center.x
        let y = bageLabel.center.y - smallView.center.y
        return sqrt(x*x + y*y)
    }
    
    let shapeLayer: CAShapeLayer = CAShapeLayer()
    
    var shapePath: UIBezierPath {
        
        let x1 = smallView.center.x
        let y1 = smallView.center.y
        
        let x2 = bageLabel.center.x
        let y2 = bageLabel.center.y
        
        let distance = distanceToBageLabel
        
        let cosθ = (y2 - y1) / distance
        let sinθ = (x2 - x1) / distance
        
        let r1 = smallView.bounds.width * 0.5
        let r2 = bageLabel.bounds.width * 0.5
        
        let pointA = CGPoint(x: x1 - r1 * cosθ, y: y1 + r1 * sinθ)
        let pointB = CGPoint(x: x1 + r1 * cosθ, y: y1 - r1 * sinθ)
        let pointC = CGPoint(x: x2 + r2 * cosθ, y: y2 - r2 * sinθ)
        let pointD = CGPoint(x: x2 - r2 * cosθ, y: y2 + r2 * sinθ)
        
        let pointO = CGPoint(x: pointA.x + distance * 0.5 * sinθ, y: pointA.y + distance * 0.5 * cosθ)
        let pointP = CGPoint(x: pointB.x + distance * 0.5 * sinθ, y: pointB.y + distance * 0.5 * cosθ)
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: pointA)
        bezierPath.addLine(to: pointB)
        bezierPath.addQuadCurve(to: pointC, controlPoint: pointO)
        bezierPath.addLine(to: pointD)
        bezierPath.addQuadCurve(to: pointA, controlPoint: pointP)
        
        return bezierPath
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupSubviews() {
        
        smallView = UIView()
        smallView.frame = bounds
        smallView.backgroundColor = .black
        addSubview(smallView)
        
        bageLabel = UILabel()
        bageLabel.frame = bounds
        bageLabel.backgroundColor = .red
        addSubview(bageLabel)
        
        shapeLayer.backgroundColor = UIColor.red.cgColor
        layer.insertSublayer(shapeLayer, at: 0)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupSubviews()
        
        panGest = UIPanGestureRecognizer()
        panGest.addTarget(self, action: #selector(gestAction(panGesture:)))
        addGestureRecognizer(panGest)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        assert(bounds.width == bounds.height, "BageView‘width must be equal to height!")
        
        if panGest.state == .changed {
            return
        }
        
        smallView.frame = bounds
        smallView.layer.cornerRadius = bounds.width * 0.5
        
        bageLabel.frame = bounds
        bageLabel.layer.cornerRadius = bounds.width * 0.5
        bageLabel.layer.masksToBounds = true
    }
    
    @objc func gestAction(panGesture: UIPanGestureRecognizer) {
        
        switch panGesture.state {
        case .began,.possible:
            break
        case .changed:
            let point = panGesture.translation(in: self)
            bageLabel.center.x = bageLabel.center.x + point.x
            bageLabel.center.y = bageLabel.center.y + point.y
            panGesture.setTranslation(CGPoint.zero, in: self)
            
            let distance = distanceToBageLabel
            
            if distance < maxDistance {

                var radius = self.bounds.size.width * 0.5
                radius = radius - distance / 10.0

                smallView.bounds = CGRect(x: 0, y: 0, width: radius * 2, height: radius * 2)
                smallView.layer.cornerRadius = radius
                
                shapeLayer.path = shapePath.cgPath
            }
            else {
                smallView.isHidden = true
                shapeLayer.path = nil
            }
            
        case .ended:
            shapeLayer.path = nil
            smallView.isHidden = false
            if distanceToBageLabel < maxDistance {
                layoutSubviews()
            }
            else {
                layoutSubviews()
            }
            break
        case .failed,.cancelled:
            bageLabel.frame = bounds
            break
        }
        
    }

}
