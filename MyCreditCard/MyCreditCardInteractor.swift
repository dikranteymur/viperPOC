//
//  MyCreditCardInteractor.swift
//  edakik
//
//  Created by Dikran Teymur on 16.08.2021.
//  Copyright © 2021 Orhun Dündar. All rights reserved.
//

import UIKit

class MyCreditCardInteractor {
    var presenter: MyCreditCardPresenterProtocol?
    var delegate: MyCreditCardInteractorDelegate?
    
    private var cardList: [GetCreditCardListResponseModel] = []
}

extension MyCreditCardInteractor: MyCreditCardInteractorProtocol {
    
    func load() {
        delegate?.handleOutput(.setLoading(true))
        
        MyCreditCardService.getCreditCard { (response) in
            if let response = response {
                self.cardList = response
                self.delegate?.handleOutput(.showCreditCardList(list: response))
                self.delegate?.handleOutput(.setLoading(false))
                self.delegate?.handleOutput(.setTableViewHeight(CGFloat(self.cardList.count * 57)))
            }
        } fail: { failString in
            LoadingView.shared.stopLoadingView()
            if failString != nil {
//                self.presenter?.showIfError(title: "Kart Listeleme Başarısız", message: failString!)
            }
            else {
//                self.presenter?.showIfError(title: "Kart Listeleme Başarısız", message: "Beklenmedik bir hata oluştu")
            }
            
            print(failString ?? "Hata Yok!!!")
        }
    }
    
    func deleteCreditCard(with model: DeleteCreditCardListRequestModel) {
        delegate?.handleOutput(.setLoading(true))
        
        MyCreditCardService.deleteCreditCard(parameters: model) { (baseResponse) in
            
        } fail: { failString in
            self.delegate?.handleOutput(.setLoading(false))
            if failString != nil {
                print("deleteCreditCard hata")
            } else {
                print(failString ?? "Hata Yok!!!")
            }
        }
    }
    
   
}
