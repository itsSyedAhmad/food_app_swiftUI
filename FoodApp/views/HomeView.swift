//
//  HomeView.swift
//  FoodApp
//
//  Created by Saif Ahmad on 14/11/26.
//

import SwiftUI

struct HomeView: View {
    
    let onTapCategory : (Category) ->Void
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Rise and shine! It's breakfast time")
                .font(.system(size: 13, weight: .medium))
                .foregroundStyle(.orangeBase)
                
            Spacer()
                
                .frame(height: 48)
               
            HStack {
                ForEach(Array(Category.displayCases.enumerated()), id: \.element) { item in

                    let index = item.offset
                    let category = item.element

                    CategoryItemCard(label: category.title, onTap: {
                        
                            onTapCategory(category)
                        
                    })

                    if index < Category.displayCases.count - 1 {
                        Spacer()
                    }
                }
                
            }
            .frame(maxWidth: .infinity)
            
            Spacer()
                
                .frame(height: 12)
            
            Spacer()
                .frame(maxWidth: .infinity)
                .frame(height: 1)
                .background(.orangeBase)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(EdgeInsets(top: 44, leading: 35, bottom: 0, trailing: 35))
    }
}

#Preview {
    HomeView(onTapCategory: {_ in })
}
