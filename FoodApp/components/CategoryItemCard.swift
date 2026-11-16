//
//  CaregoryItemCard.swift
//  FoodApp
//
//  Created by Saif Ahmad on 15/11/26.
//

import SwiftUI

struct CategoryItemCard: View {
    let category : FoodCategory
    let onTap : () -> Void
    var body: some View {
        VStack{
            Image(category.icon)
                .frame(width: 49 ,height: 62)
                .background(.categoryItemBackground)
                .clipShape(RoundedRectangle(cornerRadius: 30))
            
            Spacer()
                .frame(height: 4)
            
            Text(category.title)
                .font(.system(size: 12 , weight: .medium ))
                .foregroundStyle(.font)
            
        }
        .onTapGesture {
            onTap()
        }
    }
}

#Preview {
    CategoryItemCard(category: FoodCategory.dessert, onTap: {})
}
