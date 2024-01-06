//
//  UIComponent.swift
//  PetsServerDrivenUI
//
//  Created by Maurício Sayão on 06/01/24.
//

import UIKit

protocol UIComponent {
    var id: String { get }
    func render() -> UIView
}
