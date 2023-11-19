//
//  GetTime.swift
//  BTProjects
//
//  Created by Ario Syahputra on 19/11/23.
//

//import SwiftUI
//
//struct GetTime: View {
//    var body: some View {
//        let currentDate = Date()
//        let hour = Calendar.current.component(.hour, from: currentDate)
//        
//        let greeting: String
//        
//        switch hour {
//            case 05...10:
//                greeting = "Selamat Pagi"
//            case 11..<16:
//                greeting = "Selamat Siang"
//            case 16..<19:
//                greeting = "Selamat Sore"
//            default:
//                greeting = "Selamat Malam"
//        }
//
//        
//        return Text(greeting)
//            .font(.largeTitle)
//            .padding()
//    }
//}
//
//struct GetTime_Previews: PreviewProvider {
//    static var previews: some View {
//        GetTime()
//    }
//}

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
