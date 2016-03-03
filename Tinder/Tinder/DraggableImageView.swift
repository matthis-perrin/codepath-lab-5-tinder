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

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    func initSubviews() {
        // standard initialization logic
        let nib = UINib(nibName: "DraggableImageView", bundle: nil)
        nib.instantiateWithOwner(self, options: nil)
        imageView.frame = bounds
        addSubview(imageView)
        imageView.addGestureRecognizer(panGestureRecognizer)
    }
    
    
    @IBAction func didPanImage(sender: UIPanGestureRecognizer) {
        print("Hello")
        if sender.state == UIGestureRecognizerState.Began {
            profileImageViewCenterPoint = self.imageView.center
        } else if sender.state == UIGestureRecognizerState.Changed {
            let changeX = sender.translationInView(self).x
            imageView.center.x = profileImageViewCenterPoint.x + changeX
        }
    }
}
