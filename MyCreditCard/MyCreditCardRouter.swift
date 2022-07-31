//
//  MyCreditCardRouter.swift
//  edakik
//
//  Created by Dikran Teymur on 16.08.2021.
//  Copyright © 2021 Orhun Dündar. All rights reserved.
//

import UIKit

class MyCreditCardRouter {
    
    var view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
}

extension MyCreditCardRouter: MyCreditCardRouterProtocol {
    func navigate(to route: MyCreditCartRoute) {
        switch route {
            case .goSaveCreditCard:
                let vc = AddCreditCardBuilder.make()
                self.view.navigationController?.pushViewController(vc, animated: true)
                
            
        }
    }
    
    
}
