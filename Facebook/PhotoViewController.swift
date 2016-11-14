//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Sophia KC on 13/11/2016.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var imageView: UIImageView!
    
    // Variables
    // Prepare for segue from Feed VC
    var image: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = image

    }

    
    @IBAction func didTapDone(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
