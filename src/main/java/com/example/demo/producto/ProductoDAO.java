package com.example.demo.producto;

import java.util.List;

public interface ProductoDAO{
    List<Producto> ProductoReporte(Integer idTipoProducto);
    Producto CrearProducto(Producto producto);
    List<Producto> listaProducto();
    void eliminarProducto(int id);
    Producto findById(int id);
    void updateProducto(Producto producto);
    List<Producto> mostrarCatalogo();
}

