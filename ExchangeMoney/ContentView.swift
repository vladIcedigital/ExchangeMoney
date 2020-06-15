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
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(){
            Text("Рубли:")
            TextField("Вводить сюда", text: $roubles)
            }
            Text("Доллары: \(String((Int(roubles) ?? 0) * 74))")
        }.padding()
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
