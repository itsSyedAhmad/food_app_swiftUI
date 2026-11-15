//
//  MenuView.swift
//  FoodApp
//
//  Created by Saif Ahmad on 14/11/26.
//

import SwiftUI

struct MenuView: View {
    @Binding var selectedCategory: Category
    var body: some View {
        VStack(spacing: 0) {
            GeometryReader { p in
                HStack(spacing: 0) {
                    ForEach(Array(Category.displayCases.enumerated()), id: \.element) { item in
                        let index = item.offset
                        let category = item.element
                        
                        HStack {
                            CategoryItemCard(label: category.title, onTap: {
                                selectedCategory = category
                            })
                        }
                        .frame(maxHeight: .infinity)
                        .frame(maxWidth: p.size.width / 5, alignment: .topLeading)
                        .padding(EdgeInsets(top: 11, leading: 9, bottom: 0, trailing: 0))
                        .background(selectedCategory == category ? .whiteBase : .clear)
                        .clipShape(CurvedTabShape(radius: 30))
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 120, alignment: .topLeading)
                .padding(EdgeInsets(top: 15, leading: 35, bottom: 0, trailing: 35))
                .background(.orangeBase)
            }
            .frame(height: 135)
            
            Color.whiteBase
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .clipShape(
                    UnevenRoundedRectangle(
                        topLeadingRadius: 30,
                        topTrailingRadius: 30
                    )
                )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(.orangeBase)
    }
}

struct CurvedTabShape: Shape {
    var radius: CGFloat = 30

    func path(in rect: CGRect) -> Path {
        let w = rect.width
        let h = rect.height
        let r = min(radius, w / 2)

        var path = Path()

        // Top-left
        path.move(to: CGPoint(x: r, y: 0))

        // Top edge
        path.addLine(to: CGPoint(x: w - r, y: 0))

        // Top-right rounded corner
        path.addQuadCurve(
            to: CGPoint(x: w, y: r),
            control: CGPoint(x: w, y: 0)
        )

        // Right vertical side
        path.addLine(to: CGPoint(x: w, y: h))

        // Bottom edge
        path.addLine(to: CGPoint(x: 0, y: h))

        // Left vertical side
        path.addLine(to: CGPoint(x: 0, y: r))

        // Top-left rounded corner
        path.addQuadCurve(
            to: CGPoint(x: r, y: 0),
            control: CGPoint(x: 0, y: 0)
        )

        path.closeSubpath()

        return path
    }
}

#Preview {
    @Previewable @State var selectedCategory: Category = .none

    MenuView(selectedCategory: $selectedCategory)
}
