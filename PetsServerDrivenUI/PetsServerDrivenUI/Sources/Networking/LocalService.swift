//
//  LocalService.swift
//  PetsServerDrivenUI
//
//  Created by Maurício Sayão on 09/01/24.
//

import Foundation

final class LocalService: NetworkService {
    func laod(resource: String) async throws -> ScreenModel {
        guard let path = Bundle.main.path(forResource: resource, ofType: "json") else {
            fatalError("Resource file \(resource) not found!")
        }
        
        let data = try Data(contentsOf: URL(filePath: path))
        
        let screenModel = try JSONDecoder().decode(ScreenModel.self, from: data)
        return screenModel
    }
}
