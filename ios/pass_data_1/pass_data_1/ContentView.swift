//
//  ContentView.swift
//  pass_data_1
//
//  Created by Ryan on 8/7/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = true
    @State private var isShowingSheet = false
    
    var body: some View {
        ZStack {
            Color(isNight ? .black : .systemBlue).ignoresSafeArea()
            
            VStack {
                TimeofDayImage(imageTitle: isNight ? "moon.stars.fill" : "cloud.sun.fill")
                Button {
                    isShowingSheet = true
                } label: {ButtonLabel(title: "Change Time of Day", imageName: "clock.fill", color:.green)
                }
            }
            .sheet(isPresented: $isShowingSheet, content: {ChangeTimeofDayView(isNight: $isNight)})
        }
    }
}

struct ChangeTimeofDayView: View {
    @Binding var isNight: Bool
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            Button {
                isNight = true
                presentationMode.wrappedValue.dismiss()
            } label: {
                ButtonLabel(title: "Make Night", imageName: "moon.stars.fill", color:.black)
            }
            Button {
                isNight = false
                presentationMode.wrappedValue.dismiss()
            } label: {
                ButtonLabel(title: "Make Day", imageName: "cloud.sun.fill", color:.blue)
            }
            }
        }
    }

struct TimeofDayImage: View {
    var imageTitle: String
    var body: some View {
        Image(systemName: imageTitle)
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180)
    }
}

struct ButtonLabel: View {
    
    var title: String
    var imageName: String
    var color: Color
    
    var body: some View {
        Label(title, systemImage: imageName)
            .frame(width: 280, height: 50)
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(12)
            .padding()
    }
    }
