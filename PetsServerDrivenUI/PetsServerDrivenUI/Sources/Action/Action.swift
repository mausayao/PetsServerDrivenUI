//
//  Action.swift
//  PetsServerDrivenUI
//
//  Created by Maurício Sayão on 17/01/24.
//

import Foundation

enum ActionType: String, Decodable {
    case sheet
}

struct Action: Decodable {
    let type: ActionType
    let destination: Route
}
