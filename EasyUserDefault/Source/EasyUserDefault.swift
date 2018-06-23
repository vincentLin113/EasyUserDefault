//
//  EasyUserDefault.swift
//  EasyUserDefault
//
//  Created by Vincent Lin on 2018/6/23.
//  Copyright © 2018 Vincent Lin. All rights reserved.
//

import Foundation

public enum EasyUserDefaultError: Swift.Error {
    case targetTypeStoredValueIsEmpty
}

extension EasyUserDefaultError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .targetTypeStoredValueIsEmpty: return "Target type value is empty"
        }
    }
    
    public var localizedDescription: String {
        return "EasyUserDefaultError - "
    }
}

extension EasyUserDefaultError: CustomNSError {
    public var errorCode: Int {
        switch self {
        case .targetTypeStoredValueIsEmpty: return 801
        }
    }
}

public enum EasyUserDefaultType {
    case string, int, dictionary, array, boolean, null
}

public struct EasyUserDefault {
    fileprivate var rawString: String? = nil
    fileprivate var rawInt: Int? = nil
    fileprivate var rawDictionary: [String: Any]? = nil
    fileprivate var rawArray: [Any]? = nil
    fileprivate var rawBool: Bool? = nil
    fileprivate(set) var type: EasyUserDefaultType = .null
    fileprivate(set) var error: EasyUserDefaultError? = nil
    fileprivate var uniqueKey: String = ""
    
    var object: Any? {
        get {
            switch self.type {
            case .string:
                return rawString
            case .int:
                return rawInt
            case .dictionary:
                return rawDictionary
            case .array:
                return rawArray
            case .boolean:
                return rawBool
            default:
                return NSNull()
            }
        }
        set {
            error = nil
            type = .null
            self.rawString = nil
            self.rawInt = nil
            self.rawDictionary = nil
            self.rawArray = nil
            self.rawBool = nil
            
            switch newValue {
            case let string as String:
                self.type = .string
                self.rawString = string
            case let int as Int:
                self.type = .int
                self.rawInt = int
            case let dict as [String: Any]:
                self.type = .dictionary
                self.rawDictionary = dict
            case let array as [Any]:
                self.type = .array
                self.rawArray = array
            case let bool as Bool:
                self.type = .boolean
                self.rawBool = bool
            default:
                self.type = .null
                break
            }
        }
    }
}

//MARK: -
extension EasyUserDefault {
    
    public init(key: String) {
        self.uniqueKey = key
        storedValue()
    }
    
    /// Seve any type to `UserDefault`
    public mutating func store(_ value: Any?) {
        self.object = value
        UserDefaults.standard.set(value, forKey: self.uniqueKey)
    }
    
    
    //MARK: - Private
    fileprivate mutating func storedValue() {
        self.object = UserDefaults.standard.value(forKey: self.uniqueKey)
    }
    
    
    //MARK: - Public
    public mutating func storedValue<T>() throws -> T {
        let storedValue = UserDefaults.standard.value(forKey: self.uniqueKey)
        switch storedValue {
        case let targetType as T:
            return targetType
        default:
            self.object = storedValue
            throw EasyUserDefaultError.targetTypeStoredValueIsEmpty
        }
    }
    
    public func storedRawValue() -> Any? {
        return UserDefaults.standard.value(forKey: self.uniqueKey)
    }
    
    public func storedRawValue<T>() -> T? {
        return UserDefaults.standard.value(forKey: self.uniqueKey) as? T
    }
    
    public func clean() {
        return UserDefaults.standard.set(nil, forKey: self.uniqueKey)
    }
    
    /// Check any valid value in the `UserDefault`
    public func exist() -> Bool {
        return type != .null
    }
}


//MARK: - String
extension EasyUserDefault {
    
    var string: String? {
        switch type {
        case .string: return rawString
        default : return nil
        }
    }
    
    var stringValue: String {
        return rawString ?? ""
    }
    
}

//MARK: - Int
extension EasyUserDefault {
    
    var int: Int? {
        switch type {
        case .int: return rawInt
        default: return nil
        }
    }
    
    var intValue: Int {
        return int ?? 0
    }
}


//MARK: - Dictionary
extension EasyUserDefault {
    
    var dictionary: [String: Any]? {
        switch type {
        case .dictionary: return rawDictionary
        default: return nil
        }
    }
    
    var dictionaryValue: [String: Any] {
        return dictionary ?? [:]
    }
}


//MARK: - Bool
extension EasyUserDefault {
    
    var bool: Bool? {
        switch type {
        case .boolean: return rawBool
        default: return nil
        }
    }
    
    var boolValue: Bool {
        return bool ?? false
    }
    
}


//MARK: - Array
extension EasyUserDefault {
    
    var array: [Any]? {
        switch type {
        case .array: return rawArray
        default: return nil
        }
    }
    
    var arrayValue: [Any] {
        return array ?? [Any]()
    }
    
}

//MARK: -
extension UserDefaults {
    
    public subscript (key: String) -> EasyUserDefault {
        return EasyUserDefault(key: key)
    }
    
}

