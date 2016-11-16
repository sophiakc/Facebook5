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
    @IBOutlet var photoFrameView: UIView!
        @IBOutlet weak var scrollView: UIScrollView!
            @IBOutlet weak var photoImageView: UIImageView!
        @IBOutlet weak var doneButton: UIImageView!
        @IBOutlet weak var actionsButton: UIImageView!
    
    
    // Variables
    // Prepare for segue from Feed VC
    var image: UIImage!
    // For horizontal scrollview
    var wedding1: UIImageView!
    var wedding2: UIImageView!
    var wedding3: UIImageView!
    var wedding4: UIImageView!
    var wedding5: UIImageView!
    
//    let photoFrameViewOriginalBgColor = photoFrameView.backgroundColor

    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoImageView.image = image
        scrollView.delegate = self
        
        // Vertical scroll
        // only work for wedding1 :(
        scrollView.contentSize = CGSize(width: 320, height: photoImageView.image!.size.height)
        
        // Horizontal scroll
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width * 5, height: scrollView.frame.size.height)
        
        
        
        
//        wedding1.images.frame = scrollView.bounds
//        scrollView.addSubview(wedding1.photoImageView)
//        wedding1.images.frame.origin.x = scrollView.frame.size.width
//
//        wedding2.images.frame = scrollView.bounds
//        scrollView.addSubview(wedding2.photoImageView)
//        wedding2.frame.origin.x = scrollView.frame.size.width * 2
//
//        wedding3.images.frame = scrollView.bounds
//        scrollView.addSubview(wedding3.photoImageView)
//        wedding3.images.frame.origin.x = scrollView.frame.size.width * 3
//        
//        wedding4.images.frame = scrollView.bounds
//        scrollView.addSubview(wedding4.photoImageView)
//        wedding4.images.frame.origin.x = scrollView.frame.size.width * 4
//        
//        wedding5.images.frame = scrollView.bounds
//        scrollView.addSubview(wedding5.photoImageView)
//        wedding5.images.frame.origin.x = scrollView.frame.size.width * 5
        
        

    }
    
    @IBAction func didTapDone(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // As the user scrolls, modify the background color of the scroll view to be more or less transparent. To create a black color of different alpha values, you can use the method: UIColor(white: 0, alpha: alpha).
//        scrollView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        //fade out the done button and action buttons doneButton.backgroundColor
        photoFrameView.backgroundColor = UIColor(white: 0, alpha: 0.7)
//        scrollView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        doneButton.alpha = 0.5
        actionsButton.alpha = 0.5
        
        
//        if scrollView.contentOffset.y > 100 || scrollView.contentOffset.y < -100 {
//            dismiss(animated: true, completion: nil)
//        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        photoFrameView.backgroundColor = UIColor(white: 0, alpha: 1)
//        scrollView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        doneButton.alpha = 1
        actionsButton.alpha = 1
        
        print(scrollView.contentOffset)
        if scrollView.contentOffset.y > 100 || scrollView.contentOffset.y < -100 {
            dismiss(animated: true, completion: nil)
        }
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return photoImageView
    }

}
