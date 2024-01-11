//
//  ScreenModel.swift
//  PetsServerDrivenUI
//
//  Created by Maurício Sayão on 05/01/24.
//

import Foundation

enum ComponentError: Error {
    case decodingError
}

enum ComponentType: String, Decodable {
    case featuredImage
}

struct ComponentModel: Decodable {
    let type: ComponentType
    let data: [String: Any]
    
    private enum CodingKeys: CodingKey {
        case type
        case data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(ComponentType.self, forKey: .type)
        
        guard let data = try container.decode(JSON.self, forKey: .data).value as? [String: Any] else {
            throw ComponentError.decodingError
        }
        self.data = data
    }
}

struct ScreenModel: Decodable {
    let pageTitle: String
    let components: [ComponentModel]
}

extension ScreenModel {
    
    func buildComponents() throws -> [UIComponent] {
        
        var components: [UIComponent] = []
        
        for component in self.components {
            switch component.type {
                case .featuredImage:
                    guard let uiModel: FeaturedImageUIModel = component.data.decode() else {
                        throw ComponentError.decodingError
                    }
                    components.append(UIImageComponent(featuredImage: uiModel))
            }
        }
        
        return components
        
    }
    
}
