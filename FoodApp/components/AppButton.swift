//
//  AppButton.swift
//  FoodApp
//
//  Created by Saif Ahmad on 08/11/26.
//

import SwiftUI

struct AppButton: View {
    let label: String
    let labelColor: Color
    let backgroundColor: Color
    let onTap: () -> Void
    var body: some View {
        Button {
            onTap()
        } label: {
            Text(label)
                .font(.system(size: 24, weight: .medium))
                .frame(width: 207, height: 45)
                .foregroundStyle(labelColor)
                .background(backgroundColor, in: RoundedRectangle(cornerRadius: 30))
        }
    }
}

#Preview {
    AppButton(label: "label", labelColor: .white, backgroundColor: .red) {
        
    }
}
