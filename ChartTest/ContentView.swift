//
//  ContentView.swift
//  ChartTest
//
//  Created by peter wi on 10/24/22.
//

import Charts
import SwiftUI

struct ContentView: View {
    
    let october = Transaction.example
    let november = Transaction.example2
    
    let chartData = [
        (month: "October", data: Transaction.example),
        (month: "November", data: Transaction.example2)
    ]
    var xValues: [Double] {
        switch getXValues(month1: "October", month2: "November") {
            case 28: return stride(from: 1, to: 29, by: 3).map { $0 }
            case 29: return stride(from: 1, to: 30, by: 7).map { $0 }
            case 30: return stride(from: 1, to: 31, by: 5).map { $0 }
            case 31: return stride(from: 1, to: 32, by: 5).map { $0 }
            default: return stride(from: 1, to: 31, by: 5).map { $0 }
        }
    }
    var body: some View {
        VStack {
//            Chart {
//                ForEach(chartData, id: \.month) { series in
//                    ForEach(series.data) { item in
//                        LineMark(
//                            x: .value("Day", item.day),
//                            y: .value("Amount", item.accum_amount)
//                        )
//                    }
//                    .foregroundStyle(by: .value("Month", series.month))
//                    .interpolationMethod(.catmullRom)
//                    .symbol(by: .value("Month", series.month))
//                    .symbolSize(50)
//                    .lineStyle(StrokeStyle(lineWidth: 5))
//                }
//            }
//            .frame(height: 300)
//            //.chartXScale(domain: ClosedRange(uncheckedBounds: (lower: 1, upper: 31.0)))
//            .chartXAxis {
//                AxisMarks(values: xValues)
//            }
            
            Chart {
                ForEach(october) {
                    LineMark(
                        x: .value("Day", $0.day),
                        y: .value("Amount", $0.accum_amount)
                    )
                    .interpolationMethod(.catmullRom)
                    .foregroundStyle(.gray)
                    .foregroundStyle(by: .value("Month", "October"))
                    .lineStyle(StrokeStyle(lineWidth: 3, dash: [5,10]))
                    .symbol() {
                        Rectangle()
                            .fill(.gray)
                            .frame(width: 8, height: 8)
                            .opacity(0.3)
                    }
                    .opacity(0.3)
                }
                
                ForEach(november) {
                    LineMark(
                        x: .value("Day", $0.day),
                        y: .value("Day", $0.accum_amount)
                    )
                    .interpolationMethod(.catmullRom)
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.blue, .red]), startPoint: .leading, endPoint: .trailing))
                    .foregroundStyle(by: .value("Month", "November"))
                }
            }
            .chartXAxis {
                AxisMarks(values: xValues)
            }
            .chartLegend(position: .overlay, alignment: .top)
            .frame(height: 400)
        }
    }
    
    func getXValues(month1: String, month2: String) -> Int {
        return max(getDay(month: month1), getDay(month: month2))
    }
    
    func getDay(month: String) -> Int {
        switch (month) {
            case "January": return 31
            case "February": return 28
            case "March": return 31
            case "October": return 31
            case "November": return 30
            default: return 31
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
