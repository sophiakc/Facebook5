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
    
    let tempImageView = UIImageView()
    
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let photoViewController = toViewController as! PhotoViewController
        let photoImageView = photoViewController.photoImageView
        
        // unpack the FeedViewController for customize modal transition
        let tabBarViewController = fromViewController as! UITabBarController
        let newsFeedNavigationController = tabBarViewController.selectedViewController as! UINavigationController
        let newsFeedViewController = newsFeedNavigationController.topViewController as! NewsFeedViewController
        let selectedImageView = newsFeedViewController.selectedImageView
        
        let frame = window!.convert(selectedImageView!.frame, from: window)
//        let frame = window!.convert(selectedImageView!.frame, to: window)
//        window!.addSubview(selectedImageView)

        // 1. create a temporary UIImageView
        // 2. add it to the window
        originalSelectedImageViewFrame = photoImageView!.frame
        
        
        // 3. create a view animation
        // 4. upon completion of the animation, remove the temporary UIImageView from the window
        UIView.animate(withDuration: duration, animations: {
            photoImageView!.frame = CGRect(x: photoViewController.photoImageView.frame.origin.x, y: photoViewController.photoImageView.frame.origin.y, width: photoViewController.photoImageView.frame.width, height: photoViewController.photoImageView.frame.height)
            photoViewController.photoImageView.alpha = 1
        }) { (finished: Bool) -> Void in
            self.finish()
        }
        
//        UIView.animate(withDuration: duration, animations: {

////            fromViewController.view.alpha = 0
////            frame.alpha = 1
//            
//            tempImageView.frame = frame
//            tempImageView.image = selectedImageView?.image
//            window?.addSubview(tempImageView)
//
//            
//        }) { (finished: Bool) -> Void in
//            self.finish()
////            frame.view.alpha = 0
////            window?.removeFromSuperview(tempImageView)
//        }
        
        
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let photoViewController = fromViewController as! PhotoViewController
        let photoImageView = photoViewController.photoImageView
        let tabBarViewController = toViewController as! UITabBarController
        let newsFeedNavigationController = tabBarViewController.selectedViewController as! UINavigationController
        let newsFeedViewController = newsFeedNavigationController.topViewController as! NewsFeedViewController
        let selectedImageView = newsFeedViewController.selectedImageView
        
        let frame = window!.convert(selectedImageView!.frame, from: window)
        //        let frame = window!.convert(selectedImageView!.frame, to: window)
        
        tempImageView.alpha = 0
//        window?.removeFromSuperview(tempImageView)
        
        
        UIView.animate(withDuration: duration, animations: {
            photoImageView!.frame = CGRect(x: newsFeedViewController.selectedImageView.frame.origin.x, y: newsFeedViewController.selectedImageView.frame.origin.y, width: newsFeedViewController.selectedImageView.frame.width, height: newsFeedViewController.selectedImageView.frame.height)
            photoViewController.photoFrameView.alpha = 0
        }) { (finished: Bool) -> Void in
        self.finish()
        }
    }
}
