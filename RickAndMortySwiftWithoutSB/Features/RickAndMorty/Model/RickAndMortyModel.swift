//
//  RickAndMortyModel.swift
//  RickAndMortySwiftWithoutSB
//
//  Created by Arslan Kaan AYDIN on 9.04.2022.

import Foundation

// MARK: - PostModel
struct PostModel: Codable {
    let results: [Result]?
}

// MARK: - Result
struct Result:Codable {
    let name: String?
    let status: String?
    let image: String?
}



