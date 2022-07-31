//
//  MyCreditCardProtocols.swift
//  edakik
//
//  Created by Dikran Teymur on 16.08.2021.
//  Copyright © 2021 Orhun Dündar. All rights reserved.
//

import UIKit

// MARK: - Interactor
protocol MyCreditCardInteractorProtocol {
    var delegate: MyCreditCardInteractorDelegate? { get set }
    func load()
    func deleteCreditCard(with model: DeleteCreditCardListRequestModel)
}

enum MyCreditCardInteractorOutput {
    case setLoading(Bool)
    case showCreditCardList(list: [GetCreditCardListResponseModel])
    case setTableViewHeight(CGFloat)
}

protocol MyCreditCardInteractorDelegate {
    func handleOutput(_ output: MyCreditCardInteractorOutput)
}

// MARK: - Presenter
protocol MyCreditCardPresenterProtocol {
    func load()
    func deleteCreditCard(with model: DeleteCreditCardListRequestModel)
    func goAddCardScreen()
}

enum MyCreditCardPresenterOutput {
    case updateTitle(String)
    case setLoaing(Bool)
    case showCreditCardList([GetCreditCardListResponseModel])
    case setTableViewHeight(CGFloat)
}

// MARK: - View
protocol MyCreditCardViewProtocol {
    func handleOutput(_ output: MyCreditCardPresenterOutput)
}


// MARK: - Router
enum MyCreditCartRoute {
    case goSaveCreditCard
}

protocol MyCreditCardRouterProtocol {
    func navigate(to route: MyCreditCartRoute)
}
