//
//  Service.swift
//  iPay
//
//  Created by Aung Kyaw Phyo on 03/10/2024.
//

import Foundation

class DBService {
    
    static var currentAccount: Account?
    private var _dbManager = DBManager.shared
    
    private var _isLogined = false
    var isLogined: Bool {
        return _isLogined
    }
    
    func userLogin(username: String, password: String) -> Account? {
        if let userDict = _dbManager.userLogin(username: username, password: password) {
            let userAccount = Account(userDictionary: userDict)
            _isLogined = true
            return userAccount
        }
        return nil
    }
    
}
