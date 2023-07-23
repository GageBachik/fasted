//
//  ContentView.swift
//  fasted Watch App
//
//  Created by Gage Bachik on 7/22/23.
//

import SwiftUI

struct ContentView: View {
//    @Environment(\.managedObjectContext) var moc
//    @FetchRequest(sortDescriptors: []) var timers: FetchedResults<Cycle>
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
