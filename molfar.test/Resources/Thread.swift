//
//  Thread.swift
//  molfar.test
//
//  Created by ios.nomad on 4/27/18.
//  Copyright © 2018 ios.nomad. All rights reserved.
//

import Foundation

func main(_ dispatch: @escaping (() -> ())) {
    DispatchQueue.main.async {
        dispatch()
    }
}

func background(_ dispatch: @escaping (() -> ())) {
    DispatchQueue.global(qos: .background).async {
        dispatch()
    }
}
