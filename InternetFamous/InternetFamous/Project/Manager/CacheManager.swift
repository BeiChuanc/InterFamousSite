//
//  CacheManager.swift
//  flower
//
//  Created by 北川 on 2024/11/11.
//

import Foundation

// 缓存管理
class CacheManager {
    
    static let shared = CacheManager() // 单例
    
    private let defaults = UserDefaults.standard
    
    private init() {} // 禁止外部实例化
    
    // 存储所有类型的值
    func setValue<T>(_ value: T?, forKey key: CacheKey) {
        let keyString = key.key // 获取键的字符串表示
        if let dictionary = value as? [String: Any] {
            // 序列化字典类型
            let data = try? PropertyListSerialization.data(fromPropertyList: dictionary, format: .binary, options: 0)
            defaults.set(data, forKey: keyString)
        } else if let codableValue = value as? Codable {
            // 序列化 Codable 类型
            if let data = try? JSONEncoder().encode(codableValue) {
                defaults.set(data, forKey: keyString)
            }
        } else {
            // 处理基本数据类型
            defaults.set(value, forKey: keyString)
        }
    }
    
    // 获取所有类型的值，不限制 Decodable 协议
    func getValue<T>(forKey key: CacheKey) -> T? {
        let keyString = key.key // 获取键的字符串表示

        // 尝试获取存储的数据
        if let data = defaults.data(forKey: keyString) {
            // 1. 如果数据是字典类型
            if let dictionary = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: Any] {
                return dictionary as? T
            } else {
                // 2. 如果 T 符合 Decodable 协议，尝试解码
                if let decodedValue = decodeIfPossible(T.self, from: data) {
                    return decodedValue as? T
                }
            }
        }

        // 3. 如果都不符合，直接返回存储的原始值（适用于基本数据类型）
        return defaults.value(forKey: keyString) as? T
    }

    // 解码方法，只有在 T 符合 Decodable 协议时才会解码
    private func decodeIfPossible<T>(_ type: T.Type, from data: Data) -> Any? {
        // 检查 T 是否符合 Decodable 协议
        if T.self is Decodable.Type {
            // 将 T 转换为 Decodable，并解码
            let decoder = JSONDecoder()
            if let decodableType = T.self as? Decodable.Type {
                return try? decoder.decode(decodableType, from: data)
            }
        }
        return nil
    }
    
    // 移除指定键的数据
    func removeObject(forKey key: CacheKey) {
        let keyString = String(describing: key)
        defaults.removeObject(forKey: keyString)
    }
    
}

// 缓存键
enum CacheKey {
    
    case stringKey(String)
    
    case intKey(Int)
    
    case boolKey(Bool)
    
    case dateKey(Date)
    
    case objectKey(Any)
    
    case dictionaryKey([String: Any])
    
    // 获取存储时的键
    var key: String {
        switch self {
        case .stringKey(let value):
            return String(describing: value)
        case .intKey(let value):
            return String(describing: value)
        case .boolKey(let value):
            return String(describing: value)
        case .dateKey(let value):
            return String(describing: value)
        case .objectKey(let value):
            return String(describing: value)
        case .dictionaryKey(let value):
            return String(describing: value)
        }
    }
    
}
