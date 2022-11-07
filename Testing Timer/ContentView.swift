//
//  ContentView.swift
//  Testing Timer
//
//  Created by    wuniutian on 7/11/22.
//

import SwiftUI

struct ContentView: View {
    @State private var date = Date()
    
    var body: some View {
        VStack {
            Text("\(timePeriodTest().day!) Days Left")
                .font(.largeTitle)
            
            if #available(iOS 14.0, *) {
                DatePicker("Choose the day", selection: $date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .frame(maxHeight: 400)
            } else {
                DatePicker("Choose the day", selection: $date)
                    .frame(maxHeight: 400)
            }
        }
        
    }
    
    func timePeriodTest() -> DateComponents {
        let userDate = Calendar.current.dateComponents([.day, .month, .year], from: date)
        
        let userDateComponents = DateComponents(calendar: Calendar.current, year: userDate.year!, month: userDate.month!, day: userDate.day!).date!
        
        let daysUntil = Calendar.current.dateComponents([.day], from: Date(), to: userDateComponents)
        
        return daysUntil
    }
}
  
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

