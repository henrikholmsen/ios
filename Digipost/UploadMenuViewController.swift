//
//  UploadMenuViewController.swift
//  Digipost
//
//  Created by Håkon Bogen on 03/11/14.
//  Copyright (c) 2014 Posten. All rights reserved.
//

import UIKit

class UploadMenuViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    lazy var menuDataSource = UploadMenuDataSource()
    
    
    lazy var uploadImageController = UploadImageController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = menuDataSource
        tableView.delegate = self
        tableView.reloadData()
        tableView.tableHeaderView = UIView(frame: CGRectMake(0, 0, 0, 1))
        navigationItem.title = NSLocalizedString("upload image Controller title", comment: "")
        // Do any additional setup after loading the view.
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            uploadImageController.showCameraCaptureInViewController(self)
        case 1:
            uploadImageController.showPhotoLibraryPickerInViewController(self)
        case 2:
            performSegueWithIdentifier("uploadGuideSegue", sender: self)
        default:
            assert(false)
        }
    }
}
