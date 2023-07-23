//
//  ShowCycleComponent.swift
//  fasted
//
//  Created by Gage Bachik on 7/22/23.
//

import CoreData
import SwiftUI

struct ShowCycleComponent: View {
    var moc: NSManagedObjectContext
    var cycle: Cycle
    var dateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        return dateFormatter
    }

    var body: some View {
        Text("The current cycle started at: \(dateFormatter().string(from: cycle.startDate!)), and ends \(dateFormatter().string(from: cycle.expectedEndDate!))")
        Button(action: {
            self.moc.delete(cycle)
        }) {
            Text("Delete the current cycle")
        }.padding()
        Button(action: {
            let now = Date.now
            cycle.actualEndDate = now
            try? self.moc.save()
        }) {
            Text("End the current cycle")
        }
    }
}

// struct ShowCycleComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        ShowCycleComponent()
//    }
// }
