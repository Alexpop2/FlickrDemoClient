//
//  InternetServiceProtocols.swift
//  FlickrDemoClient
//
//  Created by Igor on 07/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation

protocol InternetServiceInput: class {
    func loadData<T>(fromURL: URL?,
                     parseInto container: T.Type,
                     success: @escaping (T) -> Void,
                     failure: @escaping (Int) -> Void) where T : Codable
}
