//
//  ContentView.swift
//  fasted
//
//  Created by Gage Bachik on 7/22/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var timers: FetchedResults<Cycle>
    var dateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        return dateFormatter
    }

    var body: some View {
        if timers.count > 0 {
            if timers.last!.actualEndDate != nil {
                CreateCycleComponent(moc: moc)
                VStack {
                    Text("old cycles").padding()
                    List(timers) { cycle in
                        if cycle.actualEndDate != nil {
                            Text("Cycle ID: \(cycle.uuid!.description.prefix(4).description), ended at: \(dateFormatter().string(from: cycle.actualEndDate!))")
                        }
                    }
                }
            } else {
                ShowCycleComponent(moc: moc, cycle: timers.last!)
            }

        } else {
            CreateCycleComponent(moc: moc)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
