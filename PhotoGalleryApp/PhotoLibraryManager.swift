//
//  PhotoLibraryManager.swift
//  PhotoGalleryApp
//
//  Created by Aleksandr Shchukin on 12/05/25.
//

import Foundation
import Photos

class PhotoLibraryManager {
    
    func requestAccessAndFetch(completion: @escaping (_ granted: Bool, _ assets: [PHAsset]) -> Void) {
        PHPhotoLibrary.requestAuthorization { status in
        switch status {
        case .authorized, .limited:
           let assets = self.fetchAssets()
           completion(true, assets)
        default:
            completion(false, [])
        }
    }
}
    
    private func fetchAssets() -> [PHAsset] {
        var fetchedAssets: [PHAsset] = []
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        let result = PHAsset.fetchAssets(with: .image, options: fetchOptions)
        result.enumerateObjects { asset, _, _ in
            fetchedAssets.append(asset)
        }
        
        return fetchedAssets
    }
}
