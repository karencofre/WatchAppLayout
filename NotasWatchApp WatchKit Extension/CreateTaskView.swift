//
//  CreateTaskView.swift
//  NotasWatchApp WatchKit Extension
//
//  Created by karen cofré on 15-07-22.
//

import SwiftUI

struct CreateTaskView: View {
    @State private var title:String = ""
    @State private var content:String = ""
    @State var notes:[Note]
    let coreDM: CoreDataManager
    var body: some View {
        ZStack {
            Color(UIColor(named:"blue")!)
                .ignoresSafeArea()
            ScrollView{
                VStack{
                    Text("title:")
                        .foregroundColor(.init(UIColor(named:"white")!))
                        .multilineTextAlignment(.leading)
                    TextField("note title..", text: $title)
                        .padding([.leading,.trailing],10)
                        .disableAutocorrection(true)
                    Text("content:")
                        .foregroundColor(.init(UIColor(named:"white")!))
                        .multilineTextAlignment(.leading)
                    TextField("note content..", text: $content)
                        .padding([.leading,.trailing],10)
                        .disableAutocorrection(true)
                    Button(action:{coreDM.saveNote(title: title, content: content)}){
                        Label("Add", systemImage: "plus")
                    }
                        .background(Color(UIColor(named:"yellow")!))
                        .clipShape(Capsule())
                        .padding()
                        .navigationTitle("Add note")
                    List(notes,id:\.self){ nota in
                        Text(nota.title ?? "")
                        Text(nota.content ?? "")
                        
                    }
                }.padding()
            }.padding([.top],10)
        }
    }
}
//
//struct CreateTaskView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateTaskView(notes: [Array<Note>()], coreDM: CoreDataManager())
//    }
//}
