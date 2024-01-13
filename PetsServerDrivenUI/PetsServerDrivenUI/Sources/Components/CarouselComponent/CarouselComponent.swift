//
//  CarouselComponent.swift
//  PetsServerDrivenUI
//
//  Created by Maurício Sayão on 11/01/24.
//

import UIKit

final class CarouselComponent: NSObject, UIComponent {
    
    private let uiModel: CarouselUIModel
    
    init(uiModel: CarouselUIModel) {
        self.uiModel = uiModel
    }
    
    var id: String {
        ComponentType.carousel.rawValue
    }
    
    func render() -> UIView {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 150, height: 150)
        
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CarouselCell.self, forCellWithReuseIdentifier: CarouselCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.clipsToBounds = true
        collectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        return collectionView
    }
    
    
}

extension CarouselComponent: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        uiModel.imageUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let resource = uiModel.imageUrls[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCell.identifier, for: indexPath) as? CarouselCell
        
        cell?.loadImage(resource: resource)
        
        return cell ?? UICollectionViewCell()
    }
}
