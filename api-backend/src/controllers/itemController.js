const admin = require("firebase-admin");
const serviceAccount = require("../../serviceAccountKey.json");

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount)
});

const db = admin.firestore();
const itemCollection = db.collection("items");

// Função para obter itens
exports.getItems = async (req, res) => {
    try {
        const snapshot = await itemCollection.get();
        const items = snapshot.docs.map(doc => ({id: doc.id, ...doc.data()}));
        res.json(items);
    } catch (error) {
        console.error("Erro ao buscar itens:", error);
        res.status(500).send("Erro ao buscar itens");
    }
};

// Função para criar um item
exports.createItem = async (req, res) => {
    try {
        const {title, description, imageUrl, category, price} = req.body;
        if (!title || !description || !imageUrl || !category || price == null) {
            return res.status(400).send("Todos os campos são obrigatórios");
        }

        const newItem = {title, description, imageUrl, category, price};
        await itemCollection.add(newItem);
        res.status(201).send("Item criado com sucesso");
    } catch (error) {
        console.error("Erro ao criar item:", error);
        res.status(500).send("Erro ao criar item");
    }
};

// Função para deletar um item
exports.deleteItem = async (req, res) => {
    try {
        const {id} = req.params;
        const itemRef = itemCollection.doc(id);
        const doc = await itemRef.get();

        if (!doc.exists) {
            return res.status(404).send("Item não encontrado");
        }

        await itemRef.delete();
        console.log(`Item ${id} removido com sucesso.`);
        res.status(200).send("Item removido com sucesso");
    } catch (error) {
        console.error("Erro ao deletar item:", error);
        res.status(500).send("Erro ao deletar item");
    }
};
