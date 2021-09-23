//
//  ContentView.swift
//  SwiftUI-PickerChallenge
//
//  Created by mac on 9/23/21.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var locationSelection = 0
    @State private var menuSelection = 4
    @State private var timeSelection = 2
    @State private var time = Date()
    
    @State private var selectedIndex = ""
    let locations = [
        "Mexico City",
        "New York City",
        "Los Angeles",
        "Toronto",
        "Chicago",
        "Houston",
        "Havana",
        "Montréal",
        "Ecatepec de Morelos",
        "Philadelphia"
    ]
    
    let menuItems = [
        "Sweet potato fries",
        "Nachos",
        "Grilled salmon salad",
        "Pad thai",
        "Fish tacos",
        "Turkey burger",
        "Poutine",
        "Potato leek soup"
    ]
    
    let times = [
        "5 pm",
        "6 pm",
        "7 pm",
        "8 pm",
        "9 pm"
    ]
    
    var body: some View {
        
        
       
        VStack(spacing: 80) {
            Text("Ottimo Ristorante")
                .font(.title)
                .bold()
            
           
            HStack {
                Picker("Location:", selection: $locationSelection) {
                    ForEach(0..<locations.count){ index in
                        Text(locations[index]).tag(index)
                    }
                  }
                .pickerStyle(MenuPickerStyle())
                Text(locations[locationSelection])
            }
       
       
            
            VStack {
                Text("Order:")
                Picker("Menu", selection: $menuSelection) {
                    ForEach(0..<menuItems.count){ index in
                        Text(menuItems[index]).tag(index)
                    }
                    
                }
                .pickerStyle(WheelPickerStyle())
            }
            
           
            
            VStack {
                Text("Pickup time:")
                 Picker("Time", selection: $timeSelection) {
                    ForEach(0..<times.count){ index in
                        Text(times[index]).tag(index)
                    }
                    
                }
                 .pickerStyle(SegmentedPickerStyle())
                 
                
                //                // Use a Date picker to select a specific time!
                //                DatePicker("Time", selection: $time)
            }
           
            Button(action: {
                
                locationSelection = .random(in: 0..<locations.count)
                menuSelection = .random(in: 0..<menuItems.count)
                timeSelection = .random(in: 0..<times.count)
                
            }, label: {
                Text("Pick for me!")
            })
            
           
            
            
        }
        .padding()
     
        
        
   
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
