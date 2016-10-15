//
//  ShapView.swift
//  DropObj
//
//  Created by Rachid on 14/10/2016.
//  Copyright © 2016 Rachid. All rights reserved.
//

import UIKit

class ShapeView: UIView {

    let size: CGFloat = 100
    let lineWidth: CGFloat = 3
    var fillColor: UIColor!
    var path: UIBezierPath!
    
    private let gravity = UIGravityBehavior()
    
    private let collider : UICollisionBehavior = {
        let collider = UICollisionBehavior()
        collider.translatesReferenceBoundsIntoBoundary = true
        return collider
    }()
    
    private lazy var animator : UIDynamicAnimator =  UIDynamicAnimator()


    func randomPath() -> UIBezierPath {
        
        let insetRect = CGRectInset(self.bounds,lineWidth,lineWidth)
        
        let shapeType = arc4random() % 2
        
        if shapeType == 0 {
            return UIBezierPath(roundedRect: insetRect, cornerRadius: 10.0)
        }
        
        return UIBezierPath(ovalInRect: insetRect)
    }
    
    func randomColor() -> UIColor {
        let hue:CGFloat = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        return UIColor(hue: hue, saturation: 0.8, brightness: 1.0, alpha: 0.8)
    }
    
    init(origin: CGPoint) {
        super.init(frame: CGRectMake(0.0, 0.0, size, size))
        self.center = origin
        self.fillColor = randomColor()
        self.backgroundColor = UIColor.clearColor()
        self.path = randomPath()
       
        animator.addBehavior(gravity)
        animator.addBehavior(collider)
        
        gravity.addItem(self)
        collider.addItem(self)
//        initGestureRecognizers()
    }
    
    
    
//    func initGestureRecognizers() {
//        let panGR = UIPanGestureRecognizer(target: self, action: #selector(ShapeView.didPan(_:)))
//        addGestureRecognizer(panGR)
//        
//        let pinchGR = UIPinchGestureRecognizer(target: self, action: #selector(ShapeView.didPinch(_:)))
//        addGestureRecognizer(pinchGR)
//        
//        let rotationGR = UIRotationGestureRecognizer(target: self, action: #selector(ShapeView.didRotate(_:)))
//        addGestureRecognizer(rotationGR)
//    }
//    
//    func didPan(panGR: UIPanGestureRecognizer) {
//        
//        self.superview!.bringSubviewToFront(self)
//        
//        var translation = panGR.translationInView(self)
//        
//        translation = CGPointApplyAffineTransform(translation, self.transform)
//        
//        self.center.x += translation.x
//        self.center.y += translation.y
//        
//        panGR.setTranslation(CGPointZero, inView: self)
//    }
//
//    func didPinch(pinchGR: UIPinchGestureRecognizer) {
//        
//        self.superview!.bringSubviewToFront(self)
//        
//        let scale = pinchGR.scale
//        
//        self.transform = CGAffineTransformScale(self.transform, scale, scale)
//        
//        pinchGR.scale = 1.0
//    }
//    
//    func didRotate(rotationGR: UIRotationGestureRecognizer) {
//        
//        self.superview!.bringSubviewToFront(self)
//        
//        let rotation = rotationGR.rotation
//        
//        self.transform = CGAffineTransformRotate(self.transform, rotation)
//        
//        rotationGR.rotation = 0.0
//    }
//    
    

    // We need to implement init(coder) to avoid compilation errors
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        
        fillColor.setFill()
        path.fill()
        path.lineWidth = lineWidth
        path.stroke()
    }
    

}
