//
//  Constants.swift
//  PetsServerDrivenUI
//
//  Created by Maurício Sayão on 05/01/24.
//

import Foundation

struct Constants {
    
    struct ScreenResources {
        static let baseUrl = "localhost:3000"
        static let petListing = "pet-listing"
        
        static func resource(for resourceName: String) -> URL? {
            var components = URLComponents()
            components.scheme = "http"
            components.encodedHost = baseUrl
            components.path = "/\(resourceName)"
            
            return components.url
        }
    }
}
