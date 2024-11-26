import SwiftUI

struct ItemDetailView: View {
    var appItem: AppItem
    var onDelete: (AppItem) -> Void
    @State private var showAlert = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 20) {
            AsyncImage(url: URL(string: appItem.imageUrl)) { image in
                image.resizable()
                    .scaledToFit()
                    .frame(height: 220)
            } placeholder: {
                ProgressView()
            }
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 5)
            
            VStack(alignment: .leading, spacing: 12) {
                Text(appItem.title)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appItem.description)
                    .font(.body)
                    .foregroundColor(.secondary)
                
                HStack {
                    Text("Categoria:")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text(appItem.category)
                        .font(.subheadline)
                }
                
                HStack {
                    Text("Preço:")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text("R$ \(appItem.price, specifier: "%.2f")")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            Button("Remover Item", role: .destructive, action: deleteItem)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.red.opacity(0.9))
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding(.horizontal)
        }
        .padding()
        .navigationTitle("Detalhes")
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
        .alert("Item Removido", isPresented: $showAlert) {
            Button("OK") { presentationMode.wrappedValue.dismiss() }
        }
    }
    
    private func deleteItem() {
        APIService.shared.deleteItem(appItem) { success in
            if success {
                onDelete(appItem)
                showAlert = true
            }
        }
    }
}
