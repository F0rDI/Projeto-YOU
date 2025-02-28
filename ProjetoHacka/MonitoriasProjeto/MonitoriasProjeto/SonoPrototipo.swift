//
//  SonoPrototipo.swift
//  temp
//
//  Created by Turma02-Backup on 28/02/25.
//

import SwiftUI

struct SonoPrototipo: View {
    @State var selectedStartHour = Date()
    @State var selectedFinalHour = Date()
    let actualDate = (Date.now)
    
    var body: some View {
        VStack {
            
            HStack {
                
                ZStack {
                    Rectangle()
                        .frame(width: 100.0, height: 30.0)
                        .foregroundColor(.gray)
                        .cornerRadius(10)
                    
                    Text ("Sono")
                    
                }
                
                Spacer()
            }
            
            Spacer()
            
            ScrollView {
                
                ZStack {
                    
                    Rectangle()
                        .foregroundColor(.gray)
                        .cornerRadius(10)
                    
                    HStack {
                        
                        
                        
                        Text (actualDate, format: .dateTime.day().month())
                            .offset(x:20)
                        
                        Spacer()
                        
                        VStack {
                            
                            HStack {
                                Text ("Dormi")
                                DatePicker("", selection: $selectedStartHour, displayedComponents: .hourAndMinute)
                                    .frame(width: 60.0, height: 20.0)
                                        .datePickerStyle(CompactDatePickerStyle())
                                        .labelsHidden()
                                        .clipped()
                                
                            }
                            
                            
                            HStack {
                                Text ("Acordei")
                                DatePicker("", selection: $selectedFinalHour, displayedComponents: .hourAndMinute)
                                    .frame(width: 60.0, height: 20.0)
                                        .datePickerStyle(CompactDatePickerStyle())
                                        .labelsHidden()
                                        .clipped()
                            }
                            
                        }
                        .offset(x:-10)
                        
                        
                    }
                    .frame(height: 70.0)
                    
                }
                
            }
                .padding()
            
        }
        .padding()
    }
}

#Preview {
    SonoPrototipo()
}
