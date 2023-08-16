//
//  ContentView.swift
//  BetterRest
//
//  Created by Sandeep Hegde on 15/08/23.
//

import SwiftUI
import CoreML

struct ContentView: View {
    
    @State private var sleepAmount = 8.0
    @State private var wakeUp = defaultWakeTime
    @State private var coffecAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMesage = ""
    @State private var showingAlert = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var body: some View {
        NavigationStack {
            
            Form {
                
                VStack(alignment: .leading, spacing: 0){
                    Text("When do you want to wake up?")
                        .font(.headline)
                    
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                
                VStack(alignment: .leading, spacing: 0){
                    Text("Desired amount of sleep")
                        .font(.headline)
                    
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                
                VStack(alignment: .leading, spacing: 0){
                    Text("Daily coffee intake")
                        .font(.headline)
                    
                    Stepper(coffecAmount == 1 ? "1 cup" : "\(coffecAmount) cups", value: $coffecAmount, in: 1...20)
                }
                
            }
            .navigationTitle("BetterRest")
            .toolbar {
                Button("Calculate", action: calculatedBedTime)
            }
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") {}
            } message: {
                Text(alertMesage)
            }
        }
    }
    
    
    
    func calculatedBedTime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60 * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffecAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            alertTitle = "Your ideal betime is..."
            alertMesage = sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch {
            alertTitle = "Error"
            alertMesage = "Sorry, there was a problem calculating your bedtime."
        }
        showingAlert = true
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
