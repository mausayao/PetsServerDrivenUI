//
//  CarouselComponent.swift
//  PetsServerDrivenUI
//
//  Created by Maurício Sayão on 11/01/24.
//

import UIKit

final class CarouselComponent: UIComponent {
    
    private let uiModel: CarouselUIModel
    
    init(uiModel: CarouselUIModel) {
        self.uiModel = uiModel
    }
    
    var id: String {
        ComponentType.carousel.rawValue
    }
    
    func render() -> UIView {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 6
        stackView.distribution = .fill
        
        uiModel.imageUrls.forEach { url in
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.downloaded(from: url, contentMode: .scaleAspectFit)
            imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
            
            stackView.addArrangedSubview(imageView)
            
        }
        
        scrollView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            
            stackView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        
        return scrollView
    }
    
    
}
