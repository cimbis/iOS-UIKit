//
//  DetailViewController.swift
//  TableView_1
//
//  Created by Janis Cimbulis on 09/05/2020.
//  Copyright © 2020 Janis Cimbulis. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var imageName: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Image #\(self.imageName! + 1)"
        navigationItem.largeTitleDisplayMode = .never

        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
}
