//
//  UserSettings.swift
//  WeChatSwift
//
//  Created by xushuifeng on 2019/8/4.
//  Copyright © 2019 alexiscn. All rights reserved.
//

import MMKV

class UserSettings {
    
    private struct Keys {
        static let chatBackgroundImage = "ChatBackground"
    }
    
    private let mmkv: MMKV
    
    init(userID: String) {
        let basePath = NSHomeDirectory().appending("/Documents/\(userID)/mmkv")
        MMKV.setMMKVBasePath(basePath)
        mmkv = MMKV(mmapID: userID)!
    }
    
    var globalBackgroundImage: String? {
        get {
            return mmkv.string(forKey: Keys.chatBackgroundImage)
        }
        set {
            if let value = newValue {
                mmkv.set(value, forKey: "ChatBackground")
            } else {
                mmkv.removeValue(forKey: Keys.chatBackgroundImage)
            }
        }
    }
    
}
