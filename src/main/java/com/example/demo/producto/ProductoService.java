package com.example.demo.producto;

import java.util.List;

public interface ProductoService  {
    
    public List<Producto> ProductoReporte(Integer idTipoProducto);

    public List<Producto> listaProducto();

    void CrearProducto(Producto producto);
    void eliminarProducto(int id);
    Producto findById(int id);
    void updateProducto(Producto producto);
    List<Producto> mostrarCatalogo();

}