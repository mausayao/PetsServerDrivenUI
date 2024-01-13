//
//  UIImageComponent.swift
//  PetsServerDrivenUI
//
//  Created by Maurício Sayão on 06/01/24.
//

import UIKit

final class UIImageComponent: UIComponent {
    
    var id: String {
        ComponentType.featuredImage.rawValue
    }
    
    let featuredImage: FeaturedImageUIModel
    
    init(featuredImage: FeaturedImageUIModel) {
        self.featuredImage = featuredImage
    }
    
    func render() -> UIView {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.downloaded(from: featuredImage.imageUrl, contentMode: .scaleAspectFit)
        imageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        return imageView
    }
}
