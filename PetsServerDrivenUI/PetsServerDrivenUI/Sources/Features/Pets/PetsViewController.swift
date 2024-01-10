//
//  PetsViewController.swift
//  PetsServerDrivenUI
//
//  Created by Maurício Sayão on 05/01/24.
//

import UIKit

class PetsViewController: UIViewController {
    
    private let viewModel = PetListViewModel(service: LocalService())
    private let petsView = PetsView()
    let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            await viewModel.load()
            petsView.add(components: viewModel.components)
        }
    }
    
    override func loadView() {
        super.loadView()
        view = petsView
    }
}

