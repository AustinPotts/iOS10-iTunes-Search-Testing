//
//  NetworkDataLoader.swift
//  iTunes Search
//
//  Created by Austin Potts on 11/28/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation


protocol NetworkDataLoader {
    // Question: what do we need for data in/data out?
    // Need Back: Data & Error
    // Provide: URLRequest
    
    func loadData(with request: URLRequest, completion: @escaping (Data?, Error?)-> Void)
    
}
