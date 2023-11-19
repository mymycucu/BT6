//
//  GetTime.swift
//  BTProjects
//
//  Created by Ario Syahputra on 19/11/23.
//

import SwiftUI

struct GetTime {
    static func getTimeGreeting() -> String {
        let currentDate = Date()
        let hour = Calendar.current.component(.hour, from: currentDate)

        switch hour {
        case 5...10:
            return "Selamat Pagi"
        case 11..<16:
            return "Selamat Siang"
        case 16..<19:
            return "Selamat Sore"
        default:
            return "Selamat Malam"
        }
    }
}
