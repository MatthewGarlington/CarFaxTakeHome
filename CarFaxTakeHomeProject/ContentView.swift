//
//  ContentView.swift
//  CarFaxTakeHomeProject
//
//  Created by Matthew Garlington on 6/28/21.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @ObservedObject var carDataViewModel = CarDataViewModel()
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 30) {
                ForEach((carDataViewModel.carData?.listings) ?? [], id: \.self)  { car in
                    CarCardView(year: car.year, make: car.make, model: car.model, price: car.currentPrice, miles: car.mileage, state: car.dealer.state, city: car.dealer.city, phoneNumber: car.dealer.phone, imageURL: car.images.large.first ?? "", trim: car.trim)
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

struct CarCardView: View {
    var year: Int
    var make: String
    var model: String
    var price: Int
    var miles: Int
    var state: String
    var city: String
    var phoneNumber: String
    var imageURL: String
    var trim: String
    var body: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .fill(Color.white)
                .frame(height: 400)
                .padding(.horizontal)
                .shadow(color: Color.black.opacity(0.4), radius: 20, x: 20, y: 20)
            VStack(alignment: .leading) {

                ZStack(alignment: .bottomLeading) {
                    KFImage(URL(string: imageURL)!)
                        .resizable()
                        .scaledToFill()
                        .cornerRadius(25.0)

                    LinearGradient(colors: [Color.black.opacity(0.6), Color.clear], startPoint: .bottom, endPoint: .center)

                    Text("\(String(year)) \(make) \(model) \(trim)")
                        .foregroundColor(Color.white)
                        .bold()
                        .padding()
                }


                VStack(alignment: .center) {

                    HStack {
                        Text("\(price)")
                            .bold()
                        Divider()
                            .background(Color.black)
                        Text("\(miles)k mi")

                        Divider()
                            .background(Color.black)
                        
                        HStack {
                            Text("\(city),")
                            Text(state)
                        }
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
