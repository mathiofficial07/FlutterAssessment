import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CrudFirestorePage extends StatefulWidget {
  @override
  _CrudFirestorePageState createState() => _CrudFirestorePageState();
}

class _CrudFirestorePageState extends State<CrudFirestorePage> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> createUser() async {
    await users.add({
      'name': nameController.text,
      'age': int.tryParse(ageController.text) ?? 0,
    });
    nameController.clear();
    ageController.clear();
  }

  Future<void> updateUser(String id) async {
    await users.doc(id).update({
      'name': nameController.text,
      'age': int.tryParse(ageController.text) ?? 0,
    });
    nameController.clear();
    ageController.clear();
  }

  Future<void> deleteUser(String id) async {
    await users.doc(id).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Firestore CRUD')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: nameController, decoration: InputDecoration(labelText: 'Name')),
            TextField(controller: ageController, decoration: InputDecoration(labelText: 'Age')),
            SizedBox(height: 10),
            ElevatedButton(onPressed: createUser, child: Text('Create')),
            SizedBox(height: 20),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: users.snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
                  final docs = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      final doc = docs[index];
                      final user = doc.data() as Map<String, dynamic>;
                      final name = user['name'];
                      final age = user['age'];

                      return ListTile(
                        title: Text(name),
                        subtitle: Text('Age: $age'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                nameController.text = name;
                                ageController.text = age.toString();
                                updateUser(doc.id);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () => deleteUser(doc.id),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
