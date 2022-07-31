//
//  MyCreditCardsVC.swift
//  edakik
//
//  Created by Dikran Teymur on 12.08.2021.
//  Copyright © 2021 Orhun Dündar. All rights reserved.
//

import UIKit
import ObjectMapper

class MyCreditCardsVC: UIViewController {

    @IBOutlet weak var creditCardTableView: UITableView!
    @IBOutlet weak var addCreditCardView: UIView!
    @IBOutlet weak var creditCardTableViewHeightConstraint: NSLayoutConstraint!
    
    var presenter: MyCreditCardPresenterProtocol?
    var creditCardList: [GetCreditCardListResponseModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        LoadingView.shared.startLoadingView()
        creditCardTableView.delegate = self
        creditCardTableView.dataSource = self
        presenter?.load()
        creditCardTableViewHeightConstraint.constant = CGFloat(0)
        
        creditCardTableView.register(UINib(nibName: "MyCreditCardTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "MyCreditCardTableViewCell")
        initUI()
        navigationItem.backButtonTitle = "Geri"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.load()
        setTableViewHeight()
    }
    
    func initUI() {
        addCreditCardView.layer.cornerRadius = 8
        addCreditCardView.layer.borderWidth = 1
        addCreditCardView.layer.borderColor = UIColor.paymentBorderColor.cgColor
        
        addCreditCardView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tikla))
        addCreditCardView.addGestureRecognizer(gesture)
    }
    
    @objc func tikla() {
        presenter?.goAddCardScreen()
 
    }
    
    

}

extension MyCreditCardsVC: MyCreditCardViewProtocol {
    func handleOutput(_ output: MyCreditCardPresenterOutput) {
        switch output {
            case .updateTitle(let title):
                self.title = title
            case .setLoaing(let isLoading):
                if !isLoading {
                    LoadingView.shared.stopLoadingView()
                } else {
                    LoadingView.shared.startLoadingView()
                }
            case .showCreditCardList(let creditCardList):
                self.creditCardList = creditCardList
                creditCardTableView.reloadData()
            case .setTableViewHeight(let height):
                creditCardTableViewHeightConstraint.constant = height
        }
    }
    
    
}

extension MyCreditCardsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return creditCardList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCreditCardTableViewCell", for: indexPath) as! MyCreditCardTableViewCell
        cell.setCreditCardCell(cardType: creditCardList[indexPath.row].kK_Tip, cardName: creditCardList[indexPath.row].kart_Adi, cardNo: creditCardList[indexPath.row].kK_No, cardDate: creditCardList[indexPath.row].tarih)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 57
    }
    
    func setTableViewHeight() {
        creditCardTableViewHeightConstraint.constant = CGFloat(creditCardList.count * 57)
    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        creditCardTableViewHeightConstraint.constant = CGFloat(creditCardList.count * 57)
//    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let deleteModel = DeleteCreditCardListRequestModel(kK_GUID: creditCardList[indexPath.row].kK_GUID, kK_Islem_ID: creditCardList[indexPath.row].kK_Islem_ID)
            presenter?.deleteCreditCard(with: deleteModel)
            
            creditCardList.remove(at: indexPath.row)
            creditCardTableView.deleteRows(at: [indexPath], with: .fade)
            creditCardTableViewHeightConstraint.constant = CGFloat(creditCardList.count * 57)
            UserDefaults.setCardId(id: nil)
            
        }
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Sil"
    }
    
    
}
