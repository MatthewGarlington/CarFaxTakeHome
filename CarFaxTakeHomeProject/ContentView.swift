//
//  ContentView.swift
//  CarFaxTakeHomeProject
//
//  Created by Matthew Garlington on 6/28/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var carDataViewModel = CarDataViewModel()
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach((carDataViewModel.carData?.listings) ?? [], id: \.self)  { car in
                    CarCardView(year: car.year, make: car.make, model: car.model, price: car.currentPrice, miles: car.mileage, location: car.dealer.city, phoneNumber: car.dealer.phone)
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

struct CarCardView: View {
    var year: Int
    var make: String
    var model: String
    var price: Int
    var miles: Int
    var location: String
    var phoneNumber: String
    var body: some View {
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
                    Text("\(year) \(make) \(model)")
                        .bold()
                    HStack {
                        Text("\(price)")
                            .bold()
                        Divider()
                            .background(Color.black)
                        Text("\(miles)k mi")

                        Divider()
                            .background(Color.black)
                        
                        Text(location)
                    }
                    .frame(height: 50)

                    HStack {
                        Spacer()
                        VStack {
                            Spacer()
                            Text("\(phoneNumber)")
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
