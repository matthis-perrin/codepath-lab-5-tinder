//
//  ViewController.swift
//  Tinder
//
//  Created by Matthis Perrin on 3/2/16.
//  Copyright © 2016 Codepath. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var auctionButtonsImageView: UIImageView!
    @IBOutlet weak var navBarImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    
    var profileImageViewCenterPoint: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didPan(sender: UIPanGestureRecognizer) {
        // Absolute (x,y) coordinates in parent view (parentView should be
        // the parent view of the tray)
        let point = sender.locationInView(self.view)
        
        if sender.state == UIGestureRecognizerState.Began {
            print("Gesture began at: \(point)")
            profileImageViewCenterPoint = profileImageView.center
        } else if sender.state == UIGestureRecognizerState.Changed {
            let changeX = sender.translationInView(self.view).x + profileImageViewCenterPoint.x
            profileImageView.center.x = changeX
        } else if sender.state == UIGestureRecognizerState.Ended {
            print("Gesture ended at: \(point)")
        }
    }

}

