//
//  MyCreditCardViewBuilder.swift
//  edakik
//
//  Created by Dikran Teymur on 16.08.2021.
//  Copyright © 2021 Orhun Dündar. All rights reserved.
//

import UIKit

final class MyCreditCardBuilder {
    static func makeView() -> MyCreditCardsVC {
        let storyboard = UIStoryboard(name: "Profile", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "MyCreditCardsVC") as! MyCreditCardsVC
        let router = MyCreditCardRouter(view: view)
        let interactor = MyCreditCardInteractor()
        let presenter = MyCreditCardPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        return view
    }
}
