//
//  ViewController.swift
//  PhotoGalleryApp
//
//  Created by Aleksandr Shchukin on 11/05/25.
//

import UIKit
import Photos

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    var assets: [PHAsset] = []
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let photoLibraryManager = PhotoLibraryManager()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        photoLibraryManager.requestAccessAndFetch { [weak self] granted, assets in DispatchQueue.main.async {
            if granted {
                self?.assets = assets
                self?.collectionView.reloadData()
                
            } else {
                self?.showPermissionAlert()
            }
            
          }
     }
  }
    
    // MARK: - UI Setup
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "PhotoCell")
        view.addSubview(collectionView)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.frame = UIScreen.main.bounds
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let spacing: CGFloat = 2
            let itemPerRow: CGFloat = 3
            let width = (view.bounds.width - (itemPerRow - 1) * spacing) / itemPerRow
            layout.itemSize = CGSize(width: width, height: width)
            layout.minimumInteritemSpacing = spacing
            layout.minimumLineSpacing = spacing
        }
    }
    
    
    
    // MARK: - Alerts
    
    private func showPermissionAlert() {
        let alert = UIAlertController (
            title: "Доступ к фото запрещен",
            message: "Пожалуйста откройте Настройки и разрешите доступ к вашей фотогалерее, что бы приложение могло отобразить изображения.",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        alert.addAction(UIAlertAction(title: "Открыть настройки", style: .default) { _ in
            
            if let settingsURL = URL(string: UIApplication.openSettingsURLString),
               UIApplication.shared.canOpenURL(settingsURL) {
                UIApplication.shared.open(settingsURL)
            }
            
        })
        
        present(alert, animated: true)
        
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return assets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCell else {
            return UICollectionViewCell()
        }
        
        let asset = assets[indexPath.item]
        let manager = PHImageManager.default()
        let size = CGSize(width: 200, height: 200)
        manager.requestImage(for: asset, targetSize: size, contentMode: .aspectFill, options: nil) { image, _ in
            cell.imageView.image = image
        }
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photoPageViewController = PhotoPageViewController()
        photoPageViewController.modalPresentationStyle = .fullScreen
        photoPageViewController.assets = assets
        photoPageViewController.startingIndex = indexPath.item
        present(photoPageViewController, animated: true)
        
    }
}
