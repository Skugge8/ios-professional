//
//  LocalState.swift
//  Bankey
//
//  Created by MoonlitPrins8 on 25.03.24.
//

import Foundation

public class LocalState {
    private enum Keys: String {
        case hasOnBoarded
    }
    
    public static var hasOnBoarded: Bool {
        get {
            return UserDefaults.standard.bool(forKey: Keys.hasOnBoarded.rawValue)
        }
        set(newValue){
            UserDefaults.standard.set(newValue, forKey: Keys.hasOnBoarded.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
}
