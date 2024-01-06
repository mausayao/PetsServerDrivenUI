//
//  WebService.swift
//  PetsServerDrivenUI
//
//  Created by Maurício Sayão on 05/01/24.
//

import Foundation

enum NetworkError: Error {
    case invalidUrl
    case invalidReponse
}

final class WebService {
    func laod(resource: String) async throws {
        guard let url = URL(string: resource) else {
            throw NetworkError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpReponse = response as? HTTPURLResponse,
        httpReponse.statusCode == 200 else {
            throw NetworkError.invalidReponse
        }
        
        
    }
}
