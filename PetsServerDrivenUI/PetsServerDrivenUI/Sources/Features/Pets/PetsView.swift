//
//  PetsView.swift
//  PetsServerDrivenUI
//
//  Created by Maurício Sayão on 08/01/24.
//

import UIKit

protocol PetsViewProtocol: AnyObject {
    func add(components: [UIComponent])
}

final class PetsView: UIView, PetsViewProtocol {
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 8
        view.axis = .vertical
        view.distribution = .fill
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupContraints()
        setupConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(stackView)
    }
    
    private func setupConfig() {
        self.backgroundColor = .white
    }
    
    private func configDynamicContent() {
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        let sa = scrollView.contentLayoutGuide
        
        stackView.topAnchor.constraint(equalTo: sa.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: sa.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: sa.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: sa.bottomAnchor).isActive = true
    }
    
    // MARK: - PetsViewProtocol
    
    func add(components: [UIComponent]) {
        components.forEach({stackView.addArrangedSubview($0.render())})
        configDynamicContent()
    }
}
