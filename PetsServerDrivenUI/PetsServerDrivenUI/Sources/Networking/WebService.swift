//
//  WebService.swift
//  PetsServerDrivenUI
//
//  Created by Maurício Sayão on 05/01/24.
//

import UIKit

enum NetworkError: Error {
    case invalidUrl
    case invalidReponse
}

final class WebService: NetworkService {
    func laod(resource: String) async throws -> ScreenModel {
        guard let url = Constants.ScreenResources.resource(for: resource) else {
            throw NetworkError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpReponse = response as? HTTPURLResponse,
        httpReponse.statusCode == 200 else {
            throw NetworkError.invalidReponse
        }
        
        return try JSONDecoder().decode(ScreenModel.self, from: data)
    }
}
