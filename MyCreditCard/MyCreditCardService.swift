//
//  MyCreditCardService.swift
//  edakik
//
//  Created by Dikran Teymur on 16.08.2021.
//  Copyright © 2021 Orhun Dündar. All rights reserved.
//

import Foundation
import ObjectMapper

class MyCreditCardService: WebService {
    // Get credit card
    public static func getCreditCard(success: @escaping ([GetCreditCardListResponseModel]?) -> Void , fail: @escaping (String?) -> Void){
        let url = ROOT_SHOPPING_URL+"api/payment/card-list"
        
        sendGetRequest(url: url, parameters: nil, authType: .shoppig) { (response) in
            if !response.isError {
                if let result: [GetCreditCardListResponseModel] = Mapper<GetCreditCardListResponseModel>().mapArray(JSONString: response.data) {
                    // Success
                    success(result)
                } else {
                    // Fail
                    fail(nil)
                }
            } else {
                // Fail
                if response.errorMessageList.count >= 1 {
                    fail(response.errorMessageList.first)
                } else {
                    fail(nil)
                }
            }
        }
    }
    
    // Delete credit card
    public static func deleteCreditCard(parameters: DeleteCreditCardListRequestModel, success: @escaping (BaseResponseModel?) -> Void , fail: @escaping (String?) -> Void){
        let url = ROOT_SHOPPING_URL+"api/payment/card-delete"
        let parameters = Mapper().toJSON(parameters)
        
        sendDeleteRequest(url: url, parameters: parameters, authType: .shoppig) { (baseResponse) in
            if !baseResponse.isError {
                if let result: BaseResponseModel = Mapper().map(JSONObject: baseResponse) {
                    // Success
                    if baseResponse.data == "Başarılı" {
                        success(result)
                    } else {
                        // Fail
                        fail("Kart Silinemedi")
                    }
                } else {
                    // Fail
                    if baseResponse.errorMessageList.count >= 1 {
                        fail(baseResponse.errorMessageList.first)
                    } else {
                        fail(nil)
                    }
                }
            }
        }
    }
}
