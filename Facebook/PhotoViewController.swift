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
    
    @IBOutlet var photoFrameView: UIView!
    
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
        
        imageView.image = image
        scrollView.delegate = self
        
        // Vertical scroll
        // only work for wedding1 :(
        scrollView.contentSize = CGSize(width: 320, height: imageView.image!.size.height)
        
        // Horizontal scroll
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width * 5, height: scrollView.frame.size.height)
        
        
//        wedding1.images.frame = scrollView.bounds
//        scrollView.addSubview(wedding1.imageView)
//        wedding1.images.frame.origin.x = scrollView.frame.size.width
//
//        wedding2.images.frame = scrollView.bounds
//        scrollView.addSubview(wedding2.imageView)
//        wedding2.frame.origin.x = scrollView.frame.size.width * 2
//
//        wedding3.images.frame = scrollView.bounds
//        scrollView.addSubview(wedding3.imageView)
//        wedding3.images.frame.origin.x = scrollView.frame.size.width * 3
//        
//        wedding4.images.frame = scrollView.bounds
//        scrollView.addSubview(wedding4.imageView)
//        wedding4.images.frame.origin.x = scrollView.frame.size.width * 4
//        
//        wedding5.images.frame = scrollView.bounds
//        scrollView.addSubview(wedding5.imageView)
//        wedding5.images.frame.origin.x = scrollView.frame.size.width * 5
        
        

    }
    
    @IBAction func didTapDone(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // As the user scrolls, modify the background color of the scroll view to be more or less transparent. To create a black color of different alpha values, you can use the method: UIColor(white: 0, alpha: alpha).
        scrollView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        //fade out the done button and action buttons doneButton.backgroundColor
        photoFrameView.backgroundColor = UIColor(white: 0, alpha: 0.5)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        photoFrameView.backgroundColor = UIColor(white: 0, alpha: 1)
        
        print(scrollView.contentOffset)
        if scrollView.contentOffset.y > 100 {
            dismiss(animated: true, completion: nil)
        }
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }

}
