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
                .frame(height: 425)
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

                    ZStack {
                        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                            .fill(Color.green.opacity(0.8))
                        HStack {
                            Text("$\(price)")
                                .bold()
                            Divider()
                                .background(Color.black)
                            Text("\(miles) miles")
                                .bold()

                            Divider()
                                .background(Color.black)

                            HStack {
                                Text("\(city),")
                                Text(state)
                                    .bold()
                            }
                            .lineLimit(1)

                        }
                        .foregroundColor(Color.white)
                        .frame(height: 50)
                    }

                    HStack {
                        Spacer()
                        VStack {
                            Spacer()
                            Button(action: {
                                let phone = "tel://"
                                let phoneNumberFormatted = phone + phoneNumber
                                guard let url = URL(string: phoneNumberFormatted) else  { return }
                                UIApplication.shared.open(url)
                            }, label: {
                                Image(systemName: "phone.circle.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(Color.green)
                                    .frame(width: 30, height: 30)
                            })
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
