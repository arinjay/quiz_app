//
//  Result.swift
//  Quiz_App
//
//  Created by Arinjay on 23/03/18.
//  Copyright © 2018 Arinjay. All rights reserved.
//

import UIKit

class Results: Codable {
    let results: [Result]
}

class Result: Codable {

    let question: String
    let correct_answer: String
    
}
