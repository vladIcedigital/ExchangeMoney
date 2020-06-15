//
//  ContentView.swift
//  ExchangeMoney
//
//  Created by Влад Вальков on 15.06.2020.
//  Copyright © 2020 Vladislav. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var roubles: String = ""
    @State var dollars: String = ""
    
    @State var currency1: Int = 30
    @State var currency2: Int = 25

    @State var rate1: Float = 1.1253
    @State var rate2: Float = 78.8516
    
    
    func getCount(data: NSDictionary) -> Int {
        let keys = data.allKeys as [Any]
        return keys.count
    }
    
    func getCurrencyTitle(json: NSDictionary, currencyIndex: Int) -> String {
        return self.getKeys(data: self.json?.value(forKey:"rates") as! NSDictionary)[currencyIndex]
    }
    
    func getRate(json: NSDictionary, currency: Int)-> Float {
        let itemData:NSDictionary = json.value(forKey: "rates") as! NSDictionary
        let itemKey:String = getCurrencyTitle(json: json, currencyIndex: currency)
        return Float(truncating: itemData.value(forKey:itemKey) as! NSNumber)
        
    }
    
    func getKeys(data: NSDictionary) -> [String] {
        let keys = data.allKeys as! [String]
        return keys.sorted()
    }
    let screenSize = UIScreen.main.bounds
  
    var json = UserDefaults.standard.value(forKey:"data") as! NSDictionary?
    
    var body: some View {
        VStack {
            Text("Актуальный курс валюты")

            HStack(alignment: .center){
                Text("\(self.getCurrencyTitle(json: self.json!, currencyIndex: currency1)):")
                TextField("\(String((Float(dollars) ?? 0) / getRate(json: json!, currency: currency2) * getRate(json: json!, currency: currency1)) )", text: $roubles).frame(width: 200).keyboardType(.decimalPad)
            }
            HStack(alignment: .center){
                Text("\(self.getCurrencyTitle(json: self.json!, currencyIndex: currency2)):")
                TextField("\(String((Float(roubles) ?? 0) / getRate(json: json!, currency: currency1) * getRate(json: json!, currency: currency2)))", text: $dollars).frame(width: 200).keyboardType(.decimalPad)
            }
            Text("Выберите валюту")
            
            HStack(alignment: .center) {
                Picker(selection: $currency1, label: Text("")) {
                    ForEach((0..<self.getCount(data: self.json?.value(forKey:"rates") as! NSDictionary))) {
                        Text(self.getKeys(data: self.json?.value(forKey:"rates") as! NSDictionary)[$0])

                    }
                    
                }.pickerStyle(WheelPickerStyle())
                    .frame(width: screenSize.width / 2 , height: 200)
                    .clipped()
                Picker(selection: $currency2, label: Text("")) {
                    ForEach((0..<self.getCount(data: self.json?.value(forKey:"rates") as! NSDictionary))) {

                        Text(self.getKeys(data: self.json?.value(forKey:"rates") as! NSDictionary)[$0])

                    }}.pickerStyle(WheelPickerStyle())
                    .frame(width: screenSize.width / 2 , height: 200)
                    .clipped()
            }.frame(height: 200)
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

