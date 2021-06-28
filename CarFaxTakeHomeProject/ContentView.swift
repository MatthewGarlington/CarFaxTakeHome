//
//  ContentView.swift
//  CarFaxTakeHomeProject
//
//  Created by Matthew Garlington on 6/28/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(0..<1, id: \.self)  { num in
                    ZStack(alignment: .top) {
                        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                            .fill(Color.black.opacity(0.2))
                            .frame(height: 350)
                            .padding(.horizontal)
                        VStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                                .fill(Color.black.opacity(0.4))
                                .frame(height: 175)


                            VStack(alignment: .leading) {
                                Text("2014 Acura ILX")
                                    .bold()
                                HStack {
                                    Text("28,495")
                                        .bold()
                                    Divider()
                                        .background(Color.black)
                                    Text("100k mi")

                                    Divider()
                                        .background(Color.black)

                                    Text("Fredericksburg, VA")
                                }
                                .frame(height: 50)

                                HStack {
                                    Spacer()
                                    VStack {
                                        Spacer()
                                        Text("508-965-7701")
                                    }
                                    Spacer()
                                }
                            }
                            .padding()
                        }
                        .padding(.horizontal)

                    }
                }
            }
            .navigationTitle("CarFax")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
