package com.example.demo.producto;

import java.time.LocalDate;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.tipoProducto.TipoProductoService;


@Controller
@RequestMapping("/producto")
public class ProductoController {

    private final TipoProductoService tipoProductoService;
    private final ProductoService productoService;


    public ProductoController(TipoProductoService tipoProductoService, ProductoService productoService) {
        this.tipoProductoService = tipoProductoService;
        this.productoService = productoService;
    }

    // MOSTRAR FORMULARIO AL NACER EN /producto/anadir (GET)
    @GetMapping("/anadir")
    public String mostrarFormularioCrear(Model model) {
        // Lista de productos para mostrar en la misma página
        model.addAttribute("productos", productoService.listaProducto());
        // Lista de categorías para el select
        model.addAttribute("categorias", tipoProductoService.listaTipoProducto());
        // Objeto vacío para el formulario
        model.addAttribute("producto", new Producto());
        return "producto/anadir";
    }

    // AÑADIR PRODUCTO
    @PostMapping("/anadir")
    public String CrearProducto(@ModelAttribute("producto") Producto producto, Model model){
        // Asegurar fecha de creación (campo NOT NULL en schema)
        if (producto.getFechaCreacion() == null) {
            producto.setFechaCreacion(LocalDate.now());
        }
        // Si el producto ya tiene id, actualizar en lugar de crear
        if (producto.getId() != 0) {
            productoService.updateProducto(producto);
        } else {
            productoService.CrearProducto(producto);
        }
        // recargar datos para la vista: la lista de productos y las categorías
        model.addAttribute("listaProductos", productoService.listaProducto());
        model.addAttribute("categorias", tipoProductoService.listaTipoProducto());
        model.addAttribute("producto", new Producto());
        return "producto/catalogoProducto"; // mostrar JSP directamente
    }

    // MOSTRAR FORMULARIO DE EDICIÓN (rellenar formulario con datos existentes)
    @GetMapping("/editar/{id}")
    public String editarProducto(@PathVariable("id") int id, Model model) {
        Producto producto = productoService.findById(id); // buscar producto en BD
        model.addAttribute("producto", producto); // lo cargamos al form
        model.addAttribute("productos", productoService.listaProducto()); // tabla
        model.addAttribute("categorias", tipoProductoService.listaTipoProducto()); // categorías
        return "producto/anadir"; // volvemos a la misma vista
    }

    // ELIMINAR PRODUCTO
    @PostMapping("/eliminar")
    public String eliminarProducto(@ModelAttribute("id") Integer id, Model model) {
        if (id != null) {
            productoService.eliminarProducto(id);
        }
        model.addAttribute("productos", productoService.listaProducto());
        model.addAttribute("categorias", tipoProductoService.listaTipoProducto());
        model.addAttribute("producto", new Producto());
        return "producto/anadir";
    }

    @PostMapping("/actualizar")
    @ResponseBody
    public ResponseEntity<String> actualizarProducto(@RequestBody Producto producto) {
        try {
            productoService.updateProducto(producto);
            return ResponseEntity.ok("Producto actualizado");
        } catch (Exception e) {
            e.printStackTrace(); // para depurar
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error al actualizar");
        }
    }   

    @GetMapping("/catalogo")
    public String mostrarCatalogo(Model model) {
        model.addAttribute("listaProductos", productoService.listaProducto());
        return "producto/catalogoProducto";
    }
    

}
