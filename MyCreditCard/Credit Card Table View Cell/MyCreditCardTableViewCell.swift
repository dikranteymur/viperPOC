//
//  MyCreditCardTableViewCell.swift
//  edakik
//
//  Created by Dikran Teymur on 16.08.2021.
//  Copyright © 2021 Orhun Dündar. All rights reserved.
//

import UIKit

class MyCreditCardTableViewCell: UITableViewCell {

    @IBOutlet weak var cardLogoImageView: UIImageView!
    @IBOutlet weak var cardNameLabel: UILabel!
    @IBOutlet weak var cardNumberLabel: UILabel!
    @IBOutlet weak var savedDateLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
//    @IBOutlet weak var bottomBarView: UIView!
    
    var creditCardItem: CreditCardItem?
    var creditCardType: CreditCardType?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initUI()
    }

    func initUI() {
        cardLogoImageView.contentMode = .scaleAspectFit
        
        cardNameLabel.font = .Semibold_15
        cardNameLabel.textColor = .myCardTextColor
        
        cardNumberLabel.font = .Semibold_15
        cardNumberLabel.textColor = .myCardTextColor
        
        savedDateLabel.font = .Semibold_12
        savedDateLabel.textColor = .myCardTextColor
        
        dateLabel.font = .Semibold_12
        dateLabel.textColor = .myCardTextColor
    }
    
    func setCreditCardCell(card: GetCreditCardListResponseModel) {
        if card.kK_Tip == "VISA" {
            cardLogoImageView.image = UIImage(named: "visa.fill.logo")
        } else {
            cardLogoImageView.image = UIImage(named: "mastercard.logo")
        }
        
        cardNameLabel.text = card.kart_Adi
        cardNumberLabel.text = card.kK_No
    }
    
    func setCreditCardCell(cardType: String, cardName: String, cardNo: String, cardDate: String) {
        if cardType == "VISA" {
            cardLogoImageView.image = UIImage(named: "visa.fill.logo")
        } else {
            cardLogoImageView.image = UIImage(named: "mastercard.logo")
        }
        
        cardNameLabel.text = cardName
        cardNumberLabel.text = insertSpacingToCard(no: cardNo)
        dateLabel.text = setDateLabel(dateString: cardDate)
    }
    
    func setDateLabel(dateString: String) -> String {
        let dateString = dateString.toISODate()?.toFormat("dd.MM.yyyy") ?? ""
        return dateString
    }
    

    func insertSpacingToCard(no: String) -> String {
        var cardNo = no
        var offset = 4

        for _ in 0...2 {
            let index = cardNo.index(cardNo.startIndex, offsetBy: offset)
            cardNo.insert(" ", at: index)
            offset += 5
        }
        
        return cardNo
    }
    

}
