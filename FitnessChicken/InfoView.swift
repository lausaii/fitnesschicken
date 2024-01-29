//
//  InfoView.swift
//  Fitness Chicken
//
//  Created by Laurence Sy on 9/25/23.
//

import SwiftUI

struct NavigationItem: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var icon: String
    var menu: Menu
}

var navigationItems = [
    NavigationItem(title: "Table Legend", icon: "tag", menu: .legend),
    NavigationItem(title: "User Guide", icon: "person.fill.questionmark", menu: .guide),
    NavigationItem(title: "About", icon: "face.smiling", menu: .about),
]

enum Menu: String {
    case legend
    case guide
    case about
}

struct InfoView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        NavigationStack {
            List(navigationItems) { item in
                NavigationLink(value: item) {
                    Label(item.title, systemImage: item.icon)
                        .foregroundColor(.primary)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Help")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: NavigationItem.self) { item in
                switch item.menu {
                case .legend:
                    LegendView()
                case .guide:
                    VStack{
                        Image(colorScheme == .dark ? "guide-dark":"guide-light")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                case .about:
                    ZStack{
                        VStack{
                            Spacer()
                            Image("ChickenIcon")
                                .resizable()
                                .frame(width: 200, height: 200)
                            Text("Fitness Chicken v1.0")
                            Link(destination: URL(string: "https://linktr.ee/laurencesy")!, label: {
                                Text("by Laurence Sy")
                            })
                            .foregroundColor(.brown)
                            Spacer()
                            Text("Copyright 2023, Laurence Sy").font(.caption)
                            Text("All rights reserved.").font(.caption)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    InfoView()
}
