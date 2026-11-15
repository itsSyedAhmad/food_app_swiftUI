//
//  CaregoryItemCard.swift
//  FoodApp
//
//  Created by Saif Ahmad on 15/11/26.
//

import SwiftUI

struct CategoryItemCard: View {
    let label : String
    let onTap : () -> Void
    var body: some View {
        VStack{
            Color(.categoryItemBackground)
                .frame(width: 49 ,height: 62)
                .clipShape(RoundedRectangle(cornerRadius: 30))
            
            Spacer()
                .frame(height: 4)
            
            Text(label)
                .font(.system(size: 12 , weight: .medium ))
                .foregroundStyle(.font)
            
        }
        .onTapGesture {
            onTap()
        }
    }
}

#Preview {
    CategoryItemCard(label: "String", onTap: {})
}
