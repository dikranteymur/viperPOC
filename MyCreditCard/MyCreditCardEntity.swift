//
//  MyCreditCardEntity.swift
//  edakik
//
//  Created by Dikran Teymur on 16.08.2021.
//  Copyright © 2021 Orhun Dündar. All rights reserved.
//

import Foundation
import ObjectMapper

class GetCreditCardListResponseModel : Mappable {

    var id: String!
    var kK_GUID: String!
    var tarih: String!
    var kK_No: String!
    var kK_Tip: String!
    var kK_Banka: String!
    var kart_Adi: String!
    var kK_KD: String!
    var kK_SK: String!
    var kK_Islem_ID: String!
    
    init(){
    }
    
    required public init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        id <- map["id"]
        kK_GUID <- map["kK_GUID"]
        tarih <- map["tarih"]
        kK_No <- map["kK_No"]
        kK_Tip <- map["kK_Tip"]
        kK_Banka <- map["kK_Banka"]
        kart_Adi <- map["kart_Adi"]
        kK_KD <- map["kK_KD"]
        kK_SK <- map["kK_SK"]
        kK_Islem_ID <- map["kK_Islem_ID"]
    }
}

class DeleteCreditCardListRequestModel: Mappable {
    var kK_GUID: String!
    var kK_Islem_ID: String!
    
    init(kK_GUID: String, kK_Islem_ID: String) {
        self.kK_GUID = kK_GUID
        self.kK_Islem_ID = kK_Islem_ID
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        kK_GUID <- map["kK_GUID"]
        kK_Islem_ID <- map["kK_Islem_ID"]
    }
}
