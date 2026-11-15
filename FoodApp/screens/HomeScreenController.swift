//
//  HomeScreenController.swift
//  FoodApp
//
//  Created by Saif Ahmad on 08/11/26.
//

import SwiftUI

struct HomeScreenController: View {
    var body: some View {
        AppLayout(content: MainScreenContent(), header: MainScreenHeader())
    }
}

struct MainScreenHeader: View {
    var body: some View {
        Text("Main Screen Header")
    }
}

struct MainScreenContent: View {
    @State var selectedTab: Tab = .home
    @State var selectedCategory: Category = .none

    @ViewBuilder
    var currentView: some View {
        switch selectedTab {
        case .home:
            HomeView(onTapCategory: { category in
                selectedCategory = category
                selectedTab = .menu
            })

        case .menu:
            MenuView(selectedCategory: $selectedCategory)

        case .favorites:
            FavoriteView()

        case .orders:
            OrderView()

        case .help:
            HelpView()
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            currentView

            BottomNavigationBarView(selectedTab: $selectedTab, selectedCategory: $selectedCategory)
        }
    }

    struct BottomNavigationBarView: View {
        @Binding var selectedTab: Tab
        @Binding var selectedCategory: Category
        var body: some View {
            HStack(alignment: .firstTextBaseline, spacing: 0) {
                ForEach(Tab.allCases, id: \.self) { tab in
                    HStack {
                        VStack(spacing: 0) {
                            Image(systemName: tab.icon)
                                .font(.system(size: 24))

                            Text(tab.title)
                                .font(.system(size: 12))
                                .lineLimit(1)
                        }
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(selectedTab == tab ? .whiteBase : .black)
                        .padding(.vertical, 7)
                        .onTapGesture {
                            selectedTab = tab
                            selectedCategory = .none
                        }

                        Spacer()
                    }
                }
            }
            .frame(height: 61)
            .frame(maxWidth: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .background {
                Color.orangeBase
                    .clipShape(
                        UnevenRoundedRectangle(
                            topLeadingRadius: 30,
                            topTrailingRadius: 30
                        )
                    )
            }
        }
    }
}

#Preview {
    HomeScreenController()
}

