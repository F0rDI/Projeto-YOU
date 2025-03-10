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
                
                Image(systemName: "icloud.circle.fill")
                    .resizable()
                    .frame(width: 30.0, height: 30.0)
                    .foregroundColor(.blue)
                
                
                ZStack {
                    Rectangle()
                        .frame(width: 100.0, height: 30.0)
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                    
                    Text ("Sono")
                        .foregroundColor(.white)
                }
            
                Spacer()
            }
            
            Spacer()
            
            ScrollView {
                
                ZStack {
                    
                    Rectangle()
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .shadow(color: .black ,radius: 3)
                    
                    HStack {
                        
                        
                        
                        Text (actualDate, format: .dateTime.day().month())
                            .offset(x:20)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        VStack {
                            
                            HStack {
                                Text ("Dormi")
                                    .foregroundColor(.white)
                                DatePicker("", selection: $selectedStartHour, displayedComponents: .hourAndMinute)
                                    .frame(width: 60.0, height: 20.0)
                                    .datePickerStyle(CompactDatePickerStyle())
                                    .colorInvert()
                                    .colorMultiply(.white)
                                    .labelsHidden()
                                    .clipped()
                                    
                                        
                                        
                                
                            }
                            
                            
                            HStack {
                                Text ("Acordei")
                                    .foregroundColor(.white)
                                
                                DatePicker("", selection: $selectedFinalHour, displayedComponents: .hourAndMinute)
                                    .frame(width: 60.0, height: 20.0)
                                        .datePickerStyle(CompactDatePickerStyle())
                                        .labelsHidden()
                                        .clipped()
                                        .colorInvert()
                                        .colorMultiply(.white)
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
