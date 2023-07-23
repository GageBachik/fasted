//
//  ContentView.swift
//  fasted Watch App
//
//  Created by Gage Bachik on 7/22/23.
//

import CoreData
import Foundation
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Cycle.startDate, ascending: false)]) var cycles: FetchedResults<Cycle>
    
    var body: some View {
        VStack(spacing: 16) {
            if let firstCycle = cycles.first, let startDate = firstCycle.startDate {
                Text(startDate, style: .date)
            } else {
                Text("15 hours")
                    .font(.title)
                    .foregroundColor(.white)
            }
            
            Button("Start") {
                let newCycle = Cycle(context: moc)
                newCycle.uuid = UUID()
                newCycle.startDate = Date()
                
                if let expectedEndDate = Calendar.current.date(byAdding: .hour, value: 15, to: Date()) {
                    newCycle.expectedEndDate = expectedEndDate
                }
                print(newCycle)

                do {
                    try moc.save()
                } catch {
                    print("Error saving managed object context: \(error)")
                }
            }
            .background(Color(red: 1, green: 0.75, blue: 0))
            .foregroundStyle(.white)
            .buttonStyle(.bordered)
            .buttonBorderShape(.roundedRectangle)
            .cornerRadius(8)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
