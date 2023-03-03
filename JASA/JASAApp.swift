//
//  JASAApp.swift
//  JASA
//
//  Created by Айтолкун Анарбекова on 2/3/23.
//

import SwiftUI

@main
struct JASAApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ListView()
                .environmentObject(listViewModel)
                
        }
       
    }
}
