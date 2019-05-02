//
//  ProvideObject.swift
//  SimpleTodo
//
//  Created by 조서현 on 2019. 4. 28..
//  Copyright © 2019년 조서현. All rights reserved.
//

import UIKit
import Foundation

enum ProvideObject {
    case allTodoList
    
}

extension ProvideObject {
    var viewController : UIViewController {
        switch self {
        case .allTodoList:
            //let viewModel = 
            let viewController = AllTodoListViewController()
            return viewController
        }
    }
}
