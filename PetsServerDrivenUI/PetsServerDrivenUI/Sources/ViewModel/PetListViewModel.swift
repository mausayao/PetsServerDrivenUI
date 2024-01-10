//
//  PetListViewModel.swift
//  PetsServerDrivenUI
//
//  Created by Maurício Sayão on 06/01/24.
//

import Foundation

@MainActor
final class PetListViewModel: ObservableObject {
    
    private var service: NetworkService
    @Published var components: [UIComponent] = []
    
    init(service: NetworkService) {
        self.service = service
    }
    
    func load() async {
        
        do {
            
            let screenModel = try await service.laod(resource: Constants.ScreenResources.petListing)
            components = try screenModel.buildComponents()
            
        } catch {
            print(error)
        }
        
    }
}
