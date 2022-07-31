//
//  MyCreditCardPresenter.swift
//  edakik
//
//  Created by Dikran Teymur on 16.08.2021.
//  Copyright © 2021 Orhun Dündar. All rights reserved.
//

import Foundation

class MyCreditCardPresenter {
    var view: MyCreditCardViewProtocol?
    var interactor: MyCreditCardInteractorProtocol?
    var router: MyCreditCardRouterProtocol?
    
    init(view: MyCreditCardViewProtocol, interactor: MyCreditCardInteractorProtocol, router: MyCreditCardRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        
        self.interactor?.delegate = self
    }
    
    
}

extension MyCreditCardPresenter: MyCreditCardPresenterProtocol {
    func load() {
        view?.handleOutput(.updateTitle("Kayıtlı Kartlarım"))
        interactor?.load()
    }
    
    func goAddCardScreen() {
        router?.navigate(to: .goSaveCreditCard)
    }
    
    func deleteCreditCard(with model: DeleteCreditCardListRequestModel) {
        interactor?.deleteCreditCard(with: model)
    }
    
}



extension MyCreditCardPresenter: MyCreditCardInteractorDelegate {
    func handleOutput(_ output: MyCreditCardInteractorOutput) {
        switch output {
            case .setLoading(let isLoading):
                view?.handleOutput(.setLoaing(isLoading))
            case .showCreditCardList(list: let list):
                view?.handleOutput(.showCreditCardList(list))
            case .setTableViewHeight(let height):
                view?.handleOutput(.setTableViewHeight(height))
            
        }
    }
    
    
}
