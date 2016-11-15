//
//  FadeTransition.swift
//  transitionDemo
//
//  Created by Timothy Lee on 11/4/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

import UIKit

class FadeTransition: BaseTransition {
    
    // Variables
    var originalSelectedImageViewFrame: CGRect!
    var originalPhotoViewFrame: CGRect!
    
    
    let window = UIApplication.shared.keyWindow
    
  
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        toViewController.view.alpha = 0
        UIView.animate(withDuration: duration, animations: {
            toViewController.view.alpha = 1
        }) { (finished: Bool) -> Void in
            self.finish()
        }
        
//        let tabBarController = fromViewController as! UITabBarController
//        let navigationController = tabBarController.selectedViewController as! UINavigationController
//        let newsFeedViewController = navigationController.topViewController as! NewsFeedViewController
//        let photoViewController = toViewController as! PhotoViewController
//        
//        let selectedImageView = newsFeedViewController.selectedImageView
//        let photoView = photoViewController.imageView
//        
//        
//        originalSelectedImageViewFrame = selectedImageView!.frame.offsetBy(dx: 0, dy: 126)
//        
//        selectedImageView!.isHidden = true
        
        // Creating window
        
        
//        let window = UIApplication.shared.keyWindow
//        window?.addSubview()
//        
        
        
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
