//
//  ViewModel.swift
//  CarFaxTakeHomeProject
//
//  Created by Matthew Garlington on 6/28/21.
//


import SwiftUI

class CarDataViewModel: ObservableObject {
    
    @Published var carData: CarData?

    init() {

        let url = URL(string: "https://carfax-for-consumers.firebaseio.com/assignment.json")!

        let task =  URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print ("error: \(error!)")
                return
            }
            guard let data = data else {
                print("No data")
                return
            }

            DispatchQueue.main.async {

                do {
                    self.carData = try JSONDecoder().decode(CarData?.self, from: data)
                 //   print(self.carData?.listings ?? "Error")
                } catch let jsonError {

                    print("Decoding failed for Vaccine Data", jsonError)
                }
            }
        }
        task.resume()
    }
}
