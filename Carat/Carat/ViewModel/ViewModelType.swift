//
//  ViewModelType.swift
//  Carat
//
//  Created by 이가영 on 2020/08/14.
//  Copyright © 2020 이가영. All rights reserved.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output 
}
