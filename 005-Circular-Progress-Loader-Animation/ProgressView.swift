//
//  ProgressView.swift
//  Circular-Image-Loader-Animation
//
//  Created by Audrey Li on 3/20/15.
//  Copyright (c) 2015 Shomigo. All rights reserved.
//

import UIKit


class ProgressView: UIView {
    
    var progressLayer: CAShapeLayer!
    var progressLabel: UILabel!
    
    // for style 
    var labelTextColor: UIColor!
    var labelFont: UIFont!
    var labelFontSize: CGFloat!
    var labelFontName: String!
    var circleStrokeColors: [UIColor]!
    var circleFillColor: UIColor!
    var circleLineWidth: CGFloat!
    
    var strokeStartValue: CGFloat!
    var strokeEndValue: CGFloat!
    
    var loadText: String!
    var loadingText: String!
    var endLoadingText: String!
    
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    init(frame: CGRect, labelTextColor: UIColor?, labelFontSize: CGFloat?,labelFontName: String?,  circleStrokeColors: [UIColor]?, circleFillColor: UIColor?, circleLineWidth: CGFloat?, strokeStartValue: CGFloat?, strokeEndValue: CGFloat?, loadText: String?, loadingText: String?, endLoadingText: String?) {
        
        super.init(frame: frame)

        self.labelTextColor = labelTextColor
        self.labelFontSize = labelFontSize ?? 40.0
        self.labelFontName = labelFontName ?? "HelveticaNeue-UltraLight"
        self.circleStrokeColors = circleStrokeColors ?? [UIColor.clearColor()]
        self.circleFillColor = circleFillColor ?? UIColor.clearColor()
        self.circleLineWidth = circleLineWidth ?? 10.0
        self.strokeStartValue = strokeStartValue ?? 0.0
        self.strokeEndValue = strokeEndValue ?? 1.0
        self.loadText =  loadText ?? "Load content"
        self.loadingText = loadingText ?? "Loading"
        self.endLoadingText = endLoadingText ?? "Done"
        
        createProgressLayer()
        createLabel()
        
    }
   
    
    private func createLabel() {
        
        progressLabel = UILabel(frame: CGRectMake(0.0, 0.0, CGRectGetWidth(frame), labelFontSize + 20.0))
        progressLabel.textColor = labelTextColor
        progressLabel.textAlignment = .Center
        progressLabel.text = loadText
        progressLabel.font = UIFont(name: labelFontName, size: labelFontSize)
        progressLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        addSubview(progressLabel)
        
        addConstraint(NSLayoutConstraint(item: self, attribute: .CenterX, relatedBy: .Equal, toItem: progressLabel, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        addConstraint(NSLayoutConstraint(item: self, attribute: .CenterY, relatedBy: .Equal, toItem: progressLabel, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
    }
    
    private func createProgressLayer() {
        progressLayer = CAShapeLayer()
        progressLayer.backgroundColor = UIColor.clearColor().CGColor
        let startAngle = CGFloat(M_PI_2)
        let endAngle = CGFloat(M_PI * 2 + M_PI_2)
        let centerPoint = CGPointMake(CGRectGetWidth(frame)/2 , CGRectGetHeight(frame)/2)
        
        var gradientMaskLayer = gradientMask()
        progressLayer.path = UIBezierPath(arcCenter:centerPoint, radius: CGRectGetWidth(frame)/2 - 30.0, startAngle:startAngle, endAngle:endAngle, clockwise: true).CGPath
        progressLayer.backgroundColor = UIColor.clearColor().CGColor
        progressLayer.fillColor = circleFillColor.CGColor
        progressLayer.strokeColor = UIColor.blackColor().CGColor
        progressLayer.lineWidth = circleLineWidth
        progressLayer.strokeStart = 0.0
        progressLayer.strokeEnd = 0.0
        
        gradientMaskLayer.mask = progressLayer
        layer.addSublayer(gradientMaskLayer)
    }
    
    private func gradientMask() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.colors = circleStrokeColors.map{$0.CGColor}
        return gradientLayer
    }
    
    func hideProgressView() {
        progressLayer.strokeEnd = 0.0
        progressLayer.removeAllAnimations()
        progressLabel.text = loadText
    }
    
    func animateProgressView() {
        progressLabel.text = loadingText
        progressLayer.strokeEnd = 0.0
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = strokeStartValue
        animation.toValue = strokeEndValue
        animation.duration = 1.0
        animation.delegate = self
        animation.removedOnCompletion = false
        animation.additive = true
        animation.fillMode = kCAFillModeForwards
        progressLayer.addAnimation(animation, forKey: "strokeEnd")
    }
    
    override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        progressLabel.text = endLoadingText
    }
}
