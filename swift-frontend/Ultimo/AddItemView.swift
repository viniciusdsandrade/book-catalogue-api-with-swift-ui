import SwiftUI

struct AddItemView: View {
    @State private var title = ""
    @State private var description = ""
    @State private var imageUrl = ""
    @State private var category = ""
    @State private var price: Double = 0.0
    @State private var showAlert = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Novo Item")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.accentColor)
            
            Form {
                Section {
                    TextField("Título", text: $title)
                    TextField("Descrição", text: $description)
                    TextField("Imagem URL", text: $imageUrl)
                    TextField("Categoria", text: $category)
                    TextField("Preço", value: $price, format: .currency(code: "BRL"))
                }
                .listRowBackground(Color(.systemGray6))
            }
            .frame(height: 250)
            
            Button(action: addItem) {
                Text("Adicionar")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(isFormValid ? Color.accentColor : Color.gray.opacity(0.5))
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .disabled(!isFormValid)
            .padding()
        }
        .padding()
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
        .alert("Item Adicionado", isPresented: $showAlert) {
            Button("OK") { presentationMode.wrappedValue.dismiss() }
        }
    }
    
    private var isFormValid: Bool {
        !title.isEmpty && !description.isEmpty && !imageUrl.isEmpty && !category.isEmpty && price > 0
    }
    
    private func addItem() {
        let newItem = AppItem(id: nil, title: title, description: description, imageUrl: imageUrl, category: category, price: price)
        APIService.shared.createItem(newItem) { success in
            if success { showAlert = true }
        }
    }
}
