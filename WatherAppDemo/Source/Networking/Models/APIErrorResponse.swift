//
//  APIErrorResponse.swift
//  WatherAppDemo
//
//  Created by Navdip Kotadiya on 08/08/22.
//

import UIKit

struct APIErrorResponse: Codable {
    var code: String?
    var message: String?

    enum CodingKeys: String, CodingKey {
        case code
        case message
    }

    init(
        code: String? = nil,
        message: String? = nil
    ) {
        self.code = code
        self.message = message
    }

    static let badURL: APIErrorResponse = .init(message: NSLocalizedString("Bad URL format", comment: ""))
    static let invalidData: APIErrorResponse = .init(message: NSLocalizedString("Invalid data", comment: ""))
    static let invalidJSON: APIErrorResponse = .init(message: NSLocalizedString("The server response didnt match our model", comment: ""))
}
