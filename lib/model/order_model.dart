class OrderModel {
  String? id;
  String cliente;
  List<OrderItem> items;
  double total;
  String estado;

  OrderModel({
    this.id,
    required this.cliente,
    required this.items,
    required this.total,
    required this.estado,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cliente': cliente,
      'items': items.map((item) => item.toMap()).toList(),
      'total': total,
      'estado': estado,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'],
      cliente: map['cliente'],
      items: List<OrderItem>.from(
          map['items'].map((item) => OrderItem.fromMap(item))),
      total: map['total'],
      estado: map['estado'],
    );
  }
}

class OrderItem {
  String nombre;
  int cantidad;
  double precio;

  OrderItem({
    required this.nombre,
    required this.cantidad,
    required this.precio,
  });

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'cantidad': cantidad,
      'precio': precio,
    };
  }

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(
      nombre: map['nombre'],
      cantidad: map['cantidad'],
      precio: map['precio'],
    );
  }
}
