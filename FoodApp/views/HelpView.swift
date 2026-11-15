//
//  HelpView.swift
//  FoodApp
//
//  Created by Saif Ahmad on 14/11/26.
//

import SwiftUI

struct HelpView: View {
    var body: some View {
        VStack(alignment: .leading , spacing: 0){
            Text("Rise and shine! It's breakfast time")
                .font(.system(size: 13,weight: .medium))
                .foregroundStyle(.orangeBase)
            
            Spacer()
                .frame(height: 48)
        }
    }
}

#Preview {
    HelpView()
}
