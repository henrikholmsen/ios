//
//  UploadGuideViewController.swift
//  Digipost
//
//  Created by Håkon Bogen on 16.09.14.
//  Copyright (c) 2014 Posten. All rights reserved.
//

import UIKit

class UploadGuideViewController: UIViewController {
    @IBOutlet weak var uploadImage: UIImageView!
    
    @IBOutlet weak var horizontalUploadImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.uploadImage.accessibilityLabel = NSLocalizedString("upload guide image accessability hint", comment: "when user taps on image, this text should be read")
        NSNotificationCenter.defaultCenter().addObserverForName("kFolderViewControllerNavigatedInList", object: nil, queue: nil) { note in
           self.dismissViewControllerAnimated(false, completion: nil)
        }
        uploadImage.image = UIImage.localizedImage(interfaceOrientation)
        view.updateConstraints()
        
        if (UIInterfaceOrientationIsLandscape(interfaceOrientation)){
            self.uploadImage.hidden = true
            self.horizontalUploadImage.hidden = false
        }else {
            self.uploadImage.hidden = false
            self.horizontalUploadImage.hidden = true
        }   
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "kFolderViewControllerNavigatedInList", object: nil)
    }
    
    override func willRotateToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        uploadImage.image = UIImage.localizedImage(toInterfaceOrientation)
        if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation)){
            self.uploadImage.hidden = true
            self.horizontalUploadImage.hidden = false
        } else {
            self.uploadImage.hidden = false
            self.horizontalUploadImage.hidden = true
        }
    }
}
