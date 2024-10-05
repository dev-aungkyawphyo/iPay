//
//  Account.swift
//  iPay
//
//  Created by Aung Kyaw Phyo on 05/10/2024.
//

import Foundation

class Account {
    
    private var _id: Int
    var id: Int {
        return _id
    }
    
    private var _phoneNo: String
    var phoneNo: String {
        return _phoneNo
    }
    
    private var _isAdmin = false
    var isAdmin: Bool {
        return _isAdmin
    }
    
    private var _dbManager = DBManager()
    
    init(_id: Int, _phoneNo: String, _isAdmin: Bool) {
        self._id = _id
        self._phoneNo = _phoneNo
        self._isAdmin = _isAdmin
    }
    
    init(userDictionary: [String: Any]) {
        self._id = userDictionary["id"] as? Int ?? 0
        self._phoneNo = userDictionary["phoneNo"] as? String ?? ""
        self._isAdmin = (userDictionary["isAdmin"] as? Int ?? 0) == 1
    }
    
    var amount: Double {
        let transaction = _dbManager.fetchTransaction(userid: id).map { transactionDict in
            return Transaction(json: transactionDict)
        }
        
        var tmpAmount = 0.0
        
        for transac in transaction {
            if transac.opr == .cashIn {
                tmpAmount += transac.amount
            } else if transac.opr == .cashOut {
                tmpAmount -= transac.amount
            } else if transac.opr == .transfer {
                if transac.fromID == id {
                    tmpAmount -= transac.amount
                }
            } else if transac.fromID != id {
                tmpAmount += transac.amount
            }
        }
        return tmpAmount
    }
    
}

