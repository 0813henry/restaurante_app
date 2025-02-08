import 'package:flutter/material.dart';
import 'package:restaurante_app/model/order_model.dart';
import '/services/database_helper.dart';
import '/services/firebase_service.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final TextEditingController _clienteController = TextEditingController();
  List<OrderItem> _items = [];
  double _total = 0;

  void _addItem(String nombre, double precio) {
    setState(() {
      _items.add(OrderItem(nombre: nombre, cantidad: 1, precio: precio));
      _calculateTotal();
    });
  }

  void _calculateTotal() {
    _total = _items.fold(0, (sum, item) => sum + (item.cantidad * item.precio));
  }

  void _saveOrder() async {
    if (_clienteController.text.isEmpty || _items.isEmpty) return;

    OrderModel order = OrderModel(
      id: DateTime.now().toString(),
      cliente: _clienteController.text,
      items: _items,
      total: _total,
      estado: 'Pendiente',
    );

    await DatabaseHelper.instance.insertOrder(order);
    await FirebaseService().saveOrderToFirebase(order);

    setState(() {
      _items.clear();
      _clienteController.clear();
      _total = 0;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Pedido guardado exitosamente')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tomar Pedido')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _clienteController,
              decoration: InputDecoration(labelText: 'Nombre del Cliente'),
            ),
            SizedBox(height: 20),
            Text('Productos:'),
            ListTile(
              title: Text('Hamburguesa'),
              trailing: ElevatedButton(
                onPressed: () => _addItem('Hamburguesa', 15000),
                child: Text('Agregar'),
              ),
            ),
            ListTile(
              title: Text('Coca Cola'),
              trailing: ElevatedButton(
                onPressed: () => _addItem('Coca Cola', 5000),
                child: Text('Agregar'),
              ),
            ),
            SizedBox(height: 20),
            Text('Total: \$$_total', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveOrder,
              child: Text('Guardar Pedido'),
            ),
          ],
        ),
      ),
    );
  }
}
