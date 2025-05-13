//
//  PhotoPageViewController.swift
//  PhotoGalleryApp
//
//  Created by Aleksandr Shchukin on 13/05/25.
//

import UIKit
import Photos

class PhotoPageViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: - Properties
    
    var assets: [PHAsset] = []
    var startingIndex: Int = 0
    
    private var collectionView: UICollectionView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        configureCollectionView()
        
    }
    
    // MARK: - UI Setup
    
    private func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.itemSize = UIScreen.main.bounds.size
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PhotoPageCell.self, forCellWithReuseIdentifier: "PhotoPageCell")
        collectionView.backgroundColor = .black
        view.addSubview(collectionView)
        
        collectionView.scrollToItem(at: IndexPath(item: startingIndex, section: 0), at: .centeredHorizontally, animated: false)
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return assets.count
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoPageCell", for: indexPath) as? PhotoPageCell else {
            
            return UICollectionViewCell()
        }
        
        let asset = assets[indexPath.item]
        let manager = PHImageManager.default()
        let size = CGSize(width: asset.pixelWidth, height: asset.pixelHeight)
        
        manager.requestImage(for: asset, targetSize: size, contentMode: .aspectFit, options: nil) { image, _ in
            cell.setImage(image)
            
        }
        
        return cell
        
    }
    
}
