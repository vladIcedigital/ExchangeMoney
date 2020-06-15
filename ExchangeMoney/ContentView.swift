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
    
    var body: some View {
        VStack(alignment: .leading) {

            HStack(){
            Text("Рубли:")
            TextField("\(String((Float(dollars) ?? 0) / 74))", text: $roubles)
            }
            HStack(){
            Text("Доллары:")
            TextField("\(String((Float(roubles) ?? 0) * 74))", text: $dollars)
            }
        }.padding()
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
