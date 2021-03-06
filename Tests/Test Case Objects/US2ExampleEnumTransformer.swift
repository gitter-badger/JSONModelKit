//
//  JMExampleEnumTransformer.swift
//  JSONModelKit
//
//  Created by Anton on 9/3/15.
//  Copyright (c) 2015 ustwo. All rights reserved.
//

import Foundation

public class JMExampleEnumTransformer : JMTransformerProtocol {
    public func transformValues(_ inputValues : Dictionary<String, Any>?) -> Any? {

        if let enumValue = inputValues!["enumValue"] as? Int {
            return EnumExample(rawValue : enumValue)!
        }
        
        return nil
    }
}


