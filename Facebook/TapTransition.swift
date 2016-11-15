//
//  TapTransition.swift
//  Facebook
//
//  Created by Sophia KC on 15/11/2016.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class TapTransition: BaseTransition {
    
    // Variables
    var originalSelectedImageViewFrame: CGRect!
    
    let window = UIApplication.shared.keyWindow
    
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let photoViewController = toViewController as! PhotoViewController
        let photoImageView = photoViewController.imageView
        
        
        
        
        // unpack the FeedViewController for customize modal transition
        let tabBarController = fromViewController as! UITabBarController
        let navigationController = tabBarController.selectedViewController as! UINavigationController
        let newsFeedViewController = navigationController.topViewController as! NewsFeedViewController
        let selectedImageView = newsFeedViewController.selectedImageView

//        let frame = window!.convert(selectedImageView!.frame, to: window)
//        let frame = window!.convert(selectedImageView!.frame, from: window)
//        let frame = window!.convert(selectedImageView!.frame, from: scrollView)
//        window!.addSubview(selectedImageView)

        // 1. create a temporary UIImageView
        // 2. add it to the window
//        originalSelectedImageViewFrame = photoImageView!.frame
//        let tempImageView = UIImageView()
//        tempImageView.frame = frame
//        tempImageView.image = selectedImageView?.image
//        window?.addSubview(tempImageView)
        
        
        UIView.animate(withDuration: duration, animations: {
        // 3. create a view animation
        // 4. upon completion of the animation, remove the temporary UIImageView from the window
//            fromViewController.view.alpha = 0
//            frame.alpha = 1
            
            
        }) { (finished: Bool) -> Void in
            self.finish()
//            frame.view.alpha = 0
        }
        
        
       
        
        
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        fromViewController.view.alpha = 1
        UIView.animate(withDuration: duration, animations: {
            fromViewController.view.alpha = 0
        }) { (finished: Bool) -> Void in
            self.finish()
        }
        
    }
}

