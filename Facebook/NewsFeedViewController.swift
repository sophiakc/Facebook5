//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Timothy Lee on 8/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    // Each image are linked here through an dragged outlet
    @IBOutlet var images: [UIImageView]!
    
    // Variables
    var photoViewController: PhotoViewController!
    var selectedImageView: UIImageView!
    var fadeTransition: FadeTransition!
    var tapTransition: TapTransition!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure the content size of the scroll view
        scrollView.contentSize = CGSize(width: 320, height: feedImageView.image!.size.height)
        
        // 2.6 Set the image of the PhotoViewController. Guide: Passing Data in Segues
        for image in images {
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapPhoto))
            
            image.addGestureRecognizer(tapRecognizer)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 50
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 50
    }
    
    
    
    @IBAction func didTapPhoto(_ sender: UITapGestureRecognizer) {
        selectedImageView = sender.view as! UIImageView
        performSegue(withIdentifier: "segueDetailPhoto", sender: nil)
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let photoViewController = segue.destination as! PhotoViewController
        
        
        if segue.identifier == "segueDetailPhoto" {
            photoViewController.image = selectedImageView.image
            photoViewController.modalPresentationStyle = .custom
            tapTransition = TapTransition()
            photoViewController.transitioningDelegate = tapTransition
            tapTransition.duration = 1.0
        }
    }
    
}
