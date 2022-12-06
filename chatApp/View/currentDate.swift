//
//  currentDate.swift
//  chatApp
//
//  Created by Amir Zhunussov on 06.12.2022.
//

import Foundation

struct CurrentDate {
    let date = Date().formatted(date: .omitted, time: .shortened)
}
