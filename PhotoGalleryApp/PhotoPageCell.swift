//
//  PhotoPageCell.swift
//  PhotoGalleryApp
//
//  Created by Aleksandr Shchukin on 13/05/25.
//

import UIKit
import Photos

class PhotoPageCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let imageView = UIImageView()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureImageView()
        
    }
    
    // MARK: - UI Setup
    
    private func configureImageView() {
        imageView.contentMode = .scaleAspectFit
        imageView.frame = contentView.bounds
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.addSubview(imageView)
    }
    // MARK: - Not Implemented
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    func setImage(_ image: UIImage?) {
        imageView.image = image
    }
    
}
