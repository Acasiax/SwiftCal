//
//  ContentView.swift
//  SwiftCal
//
//  Created by 이윤지 on 2023/03/30.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Day.date, ascending: true)],
        animation: .default)
    private var days: FetchedResults<Day>
    
    let dayOfWeek = ["일", "월", "화", "수", "목", "금", "토"]
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    ForEach(dayOfWeek, id: \.self) { dayOfWeek in
                        Text(dayOfWeek)
                            .fontWeight(.black)
                            
                            .foregroundColor(.orange)
                            .frame(maxWidth: .infinity)
                    }
                }
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7)) {
                    ForEach(days) { day in
                        Text(day.date!.formatted(.dateTime.day()))
                            .fontWeight(.bold)
                            .foregroundColor(day.didStudy ? .orange: .secondary)
                            .frame(maxWidth:.infinity, minHeight: 40)
                            .background(Circle()
                                .foregroundColor(.orange.opacity(day.didStudy ? 0.3 : 0.0)))
                        
                            
                    }
                }
                Spacer()
            }
            .navigationTitle(Date().formatted(.dateTime.month(.wide)))
            .padding()
        }
    }
   
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
