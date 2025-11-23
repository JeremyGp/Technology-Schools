package com.example.demo.tipoProducto;

import java.util.List;


public interface TipoProductoDAO {
    
    TipoProducto crearTipoProducto(TipoProducto tipoProducto);
    List<TipoProducto> listaTipoProducto();
    TipoProducto findById(int id);
    void eliminarTipoProducto(int id);
    boolean existePorNombre(String nombre);
    void updatetipoProducto(TipoProducto tipoProducto);
    List<TipoProducto> mostrarCatalogo();

}
