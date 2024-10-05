//
//  DBManager.swift
//  iPay
//
//  Created by Aung Kyaw Phyo on 03/10/2024.
//

import Foundation

class DBManager {
    
    static var shared = DBManager()
    
    private var _db = SQLiteDB.shared
    
    init() {
        openDB()
    }
    
    func openDB() {
        _ = _db.open(copyFile: true)
    }
    
    func closeDB() {
        _db.closeDB()
    }
    
    func userLogin(request: LoginRequest) -> [String: Any]? {
        let cmd = "SELECT * FROM users WHERE phoneNo = '\(request.phone)' AND password = '\(request.password)'"
        let rows = _db.query(sql: cmd)
        if rows.count == 1 {
            let row: [String: Any] = rows[0]
            let id = row["id"] as? Int ?? 0
            let phoneNo = row["phoneNo"] as? String ?? ""
            let isAdmin = row["isAdmin"] as? Int ?? 0
            return ["id": id, "phoneNo": phoneNo, "isAdmin": isAdmin]
        }
        return nil
    }
    
    func fetchTransaction(userid: Int) -> [ [String: Any] ] {
        let cmd = "SELECT * FROM 'transaction' WHERE fromid =\(userid) OR toid =\(userid)"
        let result = _db.query(sql: cmd)
        return result
    }
    
}
