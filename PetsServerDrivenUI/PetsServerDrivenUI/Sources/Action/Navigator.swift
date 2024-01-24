//
//  Navigator.swift
//  PetsServerDrivenUI
//
//  Created by Maurício Sayão on 17/01/24.
//

import UIKit

class Navigator {
    
    static func perform<V: UIView>(action: Action, content: @escaping() -> V) -> UIView {
        
        var destination: UIView?
        
        switch action.destination {
        case .petDetail:
            let view = UIView()
            view.backgroundColor = .blue
            destination = view
        }
        
        switch action.type {
        case .sheet:
            return destination ?? UIView()
        }
    }
}
