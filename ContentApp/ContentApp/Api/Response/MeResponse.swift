//
//  MeResponse.swift
//  ContentApp
//
//  Created by Никита Китаев on 13.03.2024.
//

import Foundation

struct MeResponse: Codable {
    var data: UserResponse
    var message: String
}
