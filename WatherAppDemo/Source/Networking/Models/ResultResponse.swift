//
//  ResultResponse.swift
//  WatherAppDemo
//
//  Created by Navdip Kotadiya on 08/08/22.
//

import Foundation

enum ResultResponse<T> {
    case success(T)
    case failure(APIErrorResponse)
}
