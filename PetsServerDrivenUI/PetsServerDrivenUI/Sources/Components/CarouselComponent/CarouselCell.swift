//
//  CarouselCell.swift
//  PetsServerDrivenUI
//
//  Created by Maurício Sayão on 12/01/24.
//

import UIKit

final class CarouselCell: UICollectionViewCell {
    
    static let identifier: String = String(describing: CarouselCell.self)
    
    private lazy var uiImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        config()
        configConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func config() {
        self.contentView.addSubview(uiImageView)
    }
    
    private func configConstraint() {
        NSLayoutConstraint.activate([
            uiImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            uiImageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            uiImageView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            uiImageView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
    
    func loadImage(resource: URL) {
        uiImageView.downloaded(from: resource, contentMode: .scaleAspectFill)
    }
}
