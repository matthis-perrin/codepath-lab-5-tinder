//
//  DraggableImageView.swift
//  Tinder
//
//  Created by Matthis Perrin on 3/2/16.
//  Copyright © 2016 Codepath. All rights reserved.
//

import UIKit

class DraggableImageView: UIView {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet var panGestureRecognizer: UIPanGestureRecognizer!
    var profileImageViewCenterPoint: CGPoint!
    var profileImageViewRotation: CGFloat! = CGFloat(0.0)
    var touchedHigh: Bool!

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    func initSubviews() {
        let nib = UINib(nibName: "DraggableImageView", bundle: nil)
        nib.instantiateWithOwner(self, options: nil)
        addSubview(imageView)
        imageView.frame = bounds
        imageView.addGestureRecognizer(panGestureRecognizer)
    }
    
    
    @IBAction func didPanImage(sender: UIPanGestureRecognizer) {
        if sender.state == UIGestureRecognizerState.Began {
            
            if sender.locationInView(imageView).y < imageView.frame.height / 2.0 {
                touchedHigh = true
            } else {
                touchedHigh = false
            }
            profileImageViewCenterPoint = self.imageView.center
        } else if sender.state == UIGestureRecognizerState.Changed {
            let changeX = sender.translationInView(self).x
            imageView.center.x = profileImageViewCenterPoint.x + changeX
            var rotation = ((imageView.center.x - self.center.x) / 1000) * CGFloat(M_PI)
            if !touchedHigh {
                rotation = -rotation
            }
            imageView.transform = CGAffineTransformMakeRotation(rotation)
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            
        }
    }
}
