//
//  APIRequest.swift
//  WatherAppDemo
//
//  Created by Navdip Kotadiya on 08/08/22.
//

import UIKit

protocol APIRequest {
    var url: URL? { get }
    var path: APIPath { get }
    var method: HTTPMethod { get }
    var queryItems: [URLQueryItem]? { get }
    var params: Any? { get }
    var timeoutInterval: TimeInterval { get }
    var hash: String { get }
}

extension APIRequest {
    
    // Default values
    
    var url: URL? { nil }
    
    var queryItems: [URLQueryItem]? { nil }
    
    var params: Any? { nil }
    
    var timeoutInterval: TimeInterval { 10.0 }
    
    var hash: String {
        //let combined = "\(TIMESTAMP)\(PRIVATE_KEY)\(PUBLIC_KEY)"
        //let md5Hex =  combined.MD5Hash()
        return ""
    }
}
