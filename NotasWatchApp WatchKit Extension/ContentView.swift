//
//  ContentView.swift
//  NotasWatchApp WatchKit Extension
//
//  Created by karen cofré on 14-07-22.
//

import SwiftUI

struct ContentView: View {
    @State private var animate:Bool = false
    @State private var grosor: CGFloat = 0.2
    @State private var counter:Float = 0
    var body: some View {
        
        GeometryReader { proxy in
            
                VStack(spacing:0) {
                    
                    HStack(spacing:0){
                        Circle().foregroundColor(Color(UIColor(named:"yellow")!))
                            .frame(width: proxy.size.width / 2, height: proxy.size.height / 2).overlay(startOverlay)
                        Circle().foregroundColor(Color(UIColor(named:"yellow")!))
                            .frame(width: proxy.size.width / 2, height: proxy.size.height / 2)
                            .overlay(calendarOverlay)
                      
                    }
                    Rectangle().foregroundColor(Color(UIColor(named:"yellow")!)).frame(width: proxy.size.width, height: proxy.size.height * 0.33).padding(.top,proxy.size.height / 2)
                }.overlay(alignment:.center){
                    Button(action:{counter += 0.1}){
                        ProgressView(value: counter)
                            .frame(width: proxy.frame(in: .local).width * 0.8, height: proxy.frame(in: .local).height / 4.5)
                    }.padding(.top,proxy.size.height * 0.2)
                        .frame(width: proxy.frame(in: .local).width * 0.89, height: proxy.frame(in: .local).height)
                }
            
        }
        
        .background(Color(UIColor(named:"blue")!))
                .frame(width: 174, height: 145)
                
                
        
    }
}

private var startOverlay: some View{
     
        Image(systemName: "star.fill")
        .font(.system(size:40))
    
}
private var calendarOverlay: some View{
    Image(systemName:"calendar")
        .font(.system(size: 40))
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
