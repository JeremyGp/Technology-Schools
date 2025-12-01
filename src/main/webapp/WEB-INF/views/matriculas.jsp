<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Matrícula | Technology Schools</title>

    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Poppins:wght@300;400;500&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            background-color: #e9fefe;
            font-family: 'Poppins', sans-serif;
        }

        .contenedor-formulario {
            max-width: 600px;
            margin: 40px auto;
            background: linear-gradient(180deg, #1d37c2, #1d49c2);
            padding: 40px;
            border-radius: 10px;
            color: white;
            position: relative; /* Necesario para posicionar la X */
        }

        .btn-cerrar {
            position: absolute;
            top: 15px;
            right: 20px;
            font-size: 28px;
            color: white;
            text-decoration: none;
            font-weight: bold;
        }

        .btn-cerrar:hover {
            color: #ffcccc;
            cursor: pointer;
        }

        h2 {
            text-align: center;
            font-family: 'Playfair Display', serif;
            font-size: 2rem;
        }

        label {
            display: block;
            margin-top: 20px;
            font-size: 1rem;
            font-weight: 600;
        }

        input, select {
            width: 100%;
            padding: 12px;
            border-radius: 10px;
            border: none;
            margin-top: 5px;
            font-size: 1rem;
        }

        button {
            margin-top: 30px;
            width: 100%;
            padding: 15px;
            background: white;
            color: #1d37c2;
            border: none;
            cursor: pointer;
            border-radius: 10px;
            font-size: 1.2rem;
            font-weight: 600;
        }

        button:hover {
            background: #1428a0;
            color: white;
        }
    </style>
</head>

<body>

    <div class="contenedor-formulario">

        <!-- Botón X para regresar al index -->
        <a href="/principal/index" class="btn-cerrar">✕</a>

        <h2>Registrar Matrícula</h2>

        <form action="/matricula/guardar" method="POST" onsubmit="return alertaMatricula();">

            <!-- ID DEL ESTUDIANTE -->
            <label>ID del Estudiante:</label>
            <input type="text" name="usuario_id" placeholder="Ingrese el ID del estudiante" required>

            <!-- Nombre del estudiante -->
            <label>Nombre del Estudiante:</label>
            <input type="text" name="nombre_estudiante" placeholder="Ingrese el nombre completo" required>

            <!-- Categoría -->
            <label>Categoría:</label>
            <select name="categoria_id" id="categoria" required>
                <option value="">Seleccione</option>
                <option value="1" data-precio="450.00">Mañana — S/ 450.00</option>
                <option value="2" data-precio="390.00">Tarde — S/ 390.00</option>
            </select>

            <!-- PRECIO AUTOMÁTICO -->
            <label>Precio:</label>
            <input type="text" name="categoria_precio" id="precio" readonly required>

            <!-- FECHA -->
            <label>Fecha de Registro:</label>
            <input type="date" name="fechaCreacion" required>

            <button type="submit">Guardar Matrícula</button>
        </form>
    </div>

    <script>
        // Cargar precio automáticamente
        document.getElementById("categoria").addEventListener("change", function () {
            const precio = this.options[this.selectedIndex].dataset.precio || "";
            document.getElementById("precio").value = precio;
        });

        // ALERTA DE REGISTRO EXITOSO
        function alertaMatricula() {
            alert("¡Matrícula registrada correctamente!");
            return true;
        }
    </script>

</body>
</html>
