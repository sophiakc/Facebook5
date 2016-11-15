//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Sophia KC on 13/11/2016.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {
    
    // Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var doneButton: UIImageView!
    @IBOutlet weak var actionsButton: UIImageView!
    
    // Variables
    // Prepare for segue from Feed VC
    var image: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = image
        scrollView.delegate = self
        
        // only work for wedding1 :(
        scrollView.contentSize = CGSize(width: 320, height: imageView.image!.size.height)

    }
    
    @IBAction func didTapDone(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // As the user scrolls, modify the background color of the scroll view to be more or less transparent. To create a black color of different alpha values, you can use the method: UIColor(white: 0, alpha: alpha).
        scrollView.backgroundColor = UIColor(white: 0, alpha: 0)
        
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        //fade out the done button and action buttons
//        doneButton.backgroundColor
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }

}
