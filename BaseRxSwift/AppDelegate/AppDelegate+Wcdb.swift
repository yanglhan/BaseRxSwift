//
//  AppDelegate+Wcdb.swift
//  BaseRxSwift
//
//  Created by gh on 2020/7/9.
//  Copyright © 2020 gh. All rights reserved.
//

import Foundation

import WCDBSwift

extension AppDelegate {
    
    /// 创建数据库-表
    func createWcdbTable() {
        WCDataBaseManager.shared.createTable(table: kTABLE.chat, of: FYMessageChatModel.self)
        WCDataBaseManager.shared.createTable(table: kTABLE.message, of: FYMessageItem.self)
        WCDataBaseManager.shared.createTable(table: kTABLE.session, of: FYMessageItem.self)
    }
}

