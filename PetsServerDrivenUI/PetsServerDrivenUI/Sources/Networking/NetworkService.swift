//
//  NetworkService.swift
//  PetsServerDrivenUI
//
//  Created by Maurício Sayão on 09/01/24.
//

import Foundation

protocol NetworkService {
    func laod(resource: String) async throws -> ScreenModel
}
