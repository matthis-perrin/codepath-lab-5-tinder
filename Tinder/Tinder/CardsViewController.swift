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
    @IBOutlet weak var profileImageView: DraggableImageView!
    
    var profileImageViewCenterPoint: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.imageView.image = UIImage(named: "ryan")
    }

}

