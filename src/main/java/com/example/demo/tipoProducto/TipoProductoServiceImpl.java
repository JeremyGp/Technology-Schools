package com.example.demo.tipoProducto;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class TipoProductoServiceImpl implements TipoProductoService {

    private final TipoProductoDAO tipoProductoDAO;

    public TipoProductoServiceImpl(TipoProductoDAO tipoProductoDAO) {
        this.tipoProductoDAO = tipoProductoDAO;
    }

    @Override
    public TipoProducto crearTipoProducto(TipoProducto tipoProducto) {
        return tipoProductoDAO.crearTipoProducto(tipoProducto);
    }

    @Override
    public List<TipoProducto> listaTipoProducto() {
        return tipoProductoDAO.listaTipoProducto();
    }

   @Override
    public TipoProducto findById(int id) {
        return tipoProductoDAO.findById(id);
    }


    @Override
    public void eliminarTipoProducto(int id) {
        tipoProductoDAO.eliminarTipoProducto(id);
    }

    @Override
    public boolean existePorNombre(String nombre) {
        return tipoProductoDAO.existePorNombre(nombre);
    }

    @Override
    public void updatetipoProducto(TipoProducto tipoProducto) {
        tipoProductoDAO.updatetipoProducto(tipoProducto);
    }

    @Override
    public List<TipoProducto> mostrarCatalogo() {
        return tipoProductoDAO.mostrarCatalogo();
    }
}