//
//  CreateCycleComponent.swift
//  fasted
//
//  Created by Gage Bachik on 7/22/23.
//

import CoreData
import SwiftUI

struct CreateCycleComponent: View {
    var moc: NSManagedObjectContext

    var body: some View {
        VStack {
            Button(action: {
                let now = Date.now
                let cycle = Cycle(context: self.moc)
                cycle.uuid = UUID()
                cycle.startDate = now
                cycle.expectedEndDate = Calendar.current.date(byAdding: .hour, value: 15, to: now)
                try? self.moc.save()
            }) {
                Text("Start new fasting cycle")
            }
        }
        .padding()
    }
}

// struct CreateCycleComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateCycleComponent()
//    }
// }
