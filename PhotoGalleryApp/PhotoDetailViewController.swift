//
//  PhotoDetailViewController.swift
//  PhotoGalleryApp
//
//  Created by Aleksandr Shchukin on 12/05/25.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = view.bounds
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(imageView)
        
    }
    
}
