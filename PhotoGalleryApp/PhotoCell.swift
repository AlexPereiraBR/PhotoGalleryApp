//
//  PhotoCell.swift
//  PhotoGalleryApp
//
//  Created by Aleksandr Shchukin on 12/05/25.
//

import Foundation
import UIKit

class PhotoCell: UICollectionViewCell {
    // MARK: - UI Components
    
    let imageView = UIImageView()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureImageView()
    }
        
    // MARK: - UI Setup
    
    private func configureImageView() {
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    // MARK: - Not Implemented
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
