//
//  TestViewController.swift
//  Circular-Image-Loader-Animation
//
//  Created by Audrey Li on 3/20/15.
//  Copyright (c) 2015 Shomigo. All rights reserved.
//

import UIKit

class ProgressViewController: UIViewController {

    var progressView: ProgressView!
    
    var colors: [UIColor]!
    var rect: CGRect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 52.0/255.0, green: 170.0/255.0, blue: 220.0/255.0, alpha: 0.9)
        
        let colorTop = UIColor(red: 1.0/255.0, green: 213.0/255.0, blue: 63.0/255.0, alpha: 1.0)
        let colorBottom = UIColor(red: 255.0/255.0, green: 198.0/255.0, blue: 5.0/255.0, alpha: 1.0)
        colors = [colorTop, colorBottom]
        
        rect = CGRectInset(view.bounds, 0.0, (view.bounds.height - view.bounds.width) / 2)
        
        progressView = ProgressView(frame: rect, labelTextColor: UIColor.whiteColor(), labelFontSize: 30, labelFontName: nil, circleStrokeColors: colors, circleFillColor: nil, circleLineWidth: 15, strokeStartValue: nil, strokeEndValue:nil, loadText: "Load View", loadingText: "Loading", endLoadingText: "Done")
        
        view.addSubview(progressView)
        
        progressView.animateProgressView()

    }
    
    
    @IBAction func showOutInProgress(sender: UIButton) {
        
        showOutInProgress()
    }
    
    @IBAction func showShrinkProgress(sender: UIButton) {
        
        showShrinkProgress()
    }
    
   

    
    @IBAction func showColorProgress(sender: UIButton) {
        
        removeProgressViews()
        view.backgroundColor = UIColor.whiteColor()
        
        var dx:CGFloat = 0.0
        
        for var i = 0; i < 101; i++ {
            
            let randomColor1 = UIColor(red: CGFloat(drand48()), green:  CGFloat(drand48()), blue:  CGFloat(drand48()), alpha: 0.8)
            let randomColor2 = UIColor(red: CGFloat(drand48()), green:  CGFloat(drand48()), blue:  CGFloat(drand48()), alpha: 0.8)
            
            colors = [randomColor1, randomColor2]
            
            
            var circleLineWidth = CGFloat(101 - i) * 0.02
            
            dx += circleLineWidth + 1.0
            
            var tempFrame = CGRectInset(rect, dx, dx)
            
            var strokeEndValue = CGFloat(i)/250 + 0.6
            
            var newProgressView = ProgressView(frame: tempFrame, labelTextColor: UIColor.whiteColor(), labelFontSize: 20, labelFontName: nil, circleStrokeColors: colors, circleFillColor: nil, circleLineWidth: circleLineWidth, strokeStartValue: nil, strokeEndValue:strokeEndValue, loadText: "", loadingText: "", endLoadingText: "")
            
            view.addSubview(newProgressView)
            
            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(NSEC_PER_MSEC)  * Int64(i * 80))
            dispatch_after(time, dispatch_get_main_queue()) { () -> Void in
                newProgressView.animateProgressView()
            }
            
        }

        
    }
    
    func showOutInProgress(){
        removeProgressViews()
        
        for var i = 0; i < 10; i++ {
            var tempFrame = CGRectInset(rect, 20.0 * CGFloat(i), 20.0 * CGFloat(i))
            var strokeEndValue = CGFloat(i)/20.0 + 0.5
            var newProgressView = ProgressView(frame: tempFrame, labelTextColor: UIColor.whiteColor(), labelFontSize: 20, labelFontName: nil, circleStrokeColors: colors, circleFillColor: nil, circleLineWidth: 15, strokeStartValue: 0.2, strokeEndValue:strokeEndValue, loadText: "", loadingText: "", endLoadingText: "")
            
            
            view.addSubview(newProgressView)
            
            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(NSEC_PER_SEC)  * Int64(i))
            dispatch_after(time, dispatch_get_main_queue()) { () -> Void in
                newProgressView.animateProgressView()
            }
            
        }

    }
    
    
    func showShrinkProgress() {
        removeProgressViews()
        
        var dx:CGFloat = 0.0
    
        for var i = 0; i < 31; i++ {
            
            var circleLineWidth = CGFloat(31 - i) * 0.25
            
            dx += circleLineWidth + 1.0
            
            var tempFrame = CGRectInset(rect, dx, dx)
            
            var strokeEndValue = CGFloat(i)/60 + 0.5
            
            var newProgressView = ProgressView(frame: tempFrame, labelTextColor: UIColor.whiteColor(), labelFontSize: 20, labelFontName: nil, circleStrokeColors: colors, circleFillColor: nil, circleLineWidth: circleLineWidth, strokeStartValue: nil, strokeEndValue:strokeEndValue, loadText: "", loadingText: "", endLoadingText: "")
            
            view.addSubview(newProgressView)
            
            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(NSEC_PER_MSEC)  * Int64(i * 100))
            dispatch_after(time, dispatch_get_main_queue()) { () -> Void in
                newProgressView.animateProgressView()
            }
            
        }

    }

    
    func removeProgressViews(){
        for view in self.view.subviews {
            if view.isKindOfClass(ProgressView) {
                view.removeFromSuperview()
            }
        }
        setColor()
       
    }
    func setColor() {
        let colorTop = UIColor(red: 1.0/255.0, green: 213.0/255.0, blue: 63.0/255.0, alpha: 1.0)
        let colorBottom = UIColor(red: 255.0/255.0, green: 198.0/255.0, blue: 5.0/255.0, alpha: 1.0)
        colors = [colorTop, colorBottom]
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

}
