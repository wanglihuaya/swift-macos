//
//  ContentView.swift
//  SidebarNavigation
//
//  Created by Gavin Wiggins on 5/13/21.
//

import SwiftUI

struct DetailView: View {
    
    var selected: String?
    @AppStorage("selectedStore") private var selectedStore = ""

    var body: some View {
        switch selected {
        case "One":
            selectedStore = "One"
            return Text("1️⃣ \(selectedStore) View").font(.title).frame(minWidth: 200)
        case "Two":
            selectedStore = "Two"
            return Text("2️⃣ \(selectedStore) View").font(.title).frame(minWidth: 200)
        case "Three":
            selectedStore = "Three"
            return Text("3️⃣ \(selectedStore) View").font(.title).frame(minWidth: 200)
        case "Four":
            selectedStore = "Four"
            return Text("4️⃣ \(selectedStore) View").font(.title).frame(minWidth: 200)
        default:
            return Text("Default View").font(.title).frame(minWidth: 200)
        }
    }
}

struct Sidebar: View {

    @State private var selection: String? = nil
    @AppStorage("selectedStore") private var selectedStore = ""

    var body: some View {
        List {
            NavigationLink(destination: DetailView(selected: selection), tag: "One", selection: $selection) {
                Text("One View")
            }
            NavigationLink(destination: DetailView(selected: selection), tag:"Two", selection: $selection) {
                Text("Two View")
            }
            NavigationLink(destination: DetailView(selected: selection), tag:"Three", selection: $selection) {
                Text("Three View")
            }
            NavigationLink(destination: DetailView(selected: selection), tag:"Four", selection: $selection) {
                Text("Four View")
            }
        }
        .onAppear {
            selection = selectedStore
        }
        .listStyle(SidebarListStyle())
        .toolbar {
            Button(action: toggleSidebar, label: {
                Image(systemName: "sidebar.left").help("Toggle Sidebar")
            })
        }
        .frame(minWidth: 150)
    }
}

private func toggleSidebar() {
    NSApp.keyWindow?.contentViewController?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
}

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            Sidebar()
            DetailView()
        }
        .frame(width: 500, height: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
