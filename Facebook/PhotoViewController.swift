//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Sophia KC on 13/11/2016.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    // Prepare for segue from Feed VC
    var image: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        photoImageView.image = image

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        imageView.image = image
        imageView.image = image
    }

    
    @IBAction func didTapDone(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
