import SwiftUI

struct ContentView: View {
    @State private var items: [AppItem] = []
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(items) { appItem in
                        NavigationLink(destination: ItemDetailView(appItem: appItem, onDelete: removeItem)) {
                            ItemRowView(appItem: appItem)
                                .background(Color.white)
                                .cornerRadius(12)
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .onAppear(perform: loadItems)
            .navigationTitle("Itens")
            .navigationBarItems(trailing: NavigationLink("Adicionar", destination: AddItemView()))
            .background(Color(.systemGroupedBackground).ignoresSafeArea())
        }
    }
    
    private func loadItems() {
        APIService.shared.fetchItems { fetchedItems in
            DispatchQueue.main.async {
                items = fetchedItems ?? []
            }
        }
    }
    
    private func removeItem(_ item: AppItem) {
        items.removeAll { $0.id == item.id }
    }
}

struct ItemRowView: View {
    var appItem: AppItem
    
    var body: some View {
        HStack(spacing: 12) {
            AsyncImage(url: URL(string: appItem.imageUrl)) { image in
                image.resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            } placeholder: {
                ProgressView()
                    .frame(width: 80, height: 80)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(appItem.title)
                    .font(.headline)
                Text("Categoria: \(appItem.category)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text("R$ \(appItem.price, specifier: "%.2f")")
                    .font(.subheadline)
                    .foregroundColor(.accentColor)
            }
            Spacer()
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}
