<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Technology Schools — Matrículas</title>

    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <style>
        :root {
            --turquesa: #2ec4b6;
            --turquesa-oscuro: #239c91;
            --gris-claro: #e9f9f8;
            --blanco: #ffffff;
            --acento: #ffcb77;
            --radio: 12px;
        }

        body {
            margin: 0;
            font-family: "Poppins", sans-serif;
            background-color: var(--gris-claro);
            color: #222;
        }

        /* Contenedor principal */
        .contenido-principal {
            padding: 80px 20px;
            text-align: center;
        }

        .contenido-centro h1 {
            font-family: "Playfair Display", serif;
            font-size: 36px;
            color: var(--turquesa-oscuro);
            margin-bottom: 10px;
        }

        /* Caja estilo formulario */
        .formulario-contacto {
            background: linear-gradient(145deg, var(--turquesa), var(--turquesa-oscuro));
            padding: 40px;
            max-width: 800px;
            margin: 0 auto;
            border-radius: var(--radio);
            color: var(--blanco);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            position: relative;
        }

        /* Botón X */
        .cerrar {
            position: absolute;
            top: 15px;
            right: 20px;
            background: var(--blanco);
            color: #333;
            width: 32px;
            height: 32px;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            font-weight: bold;
            text-decoration: none;
            transition: 0.3s;
        }

        .cerrar:hover {
            background: var(--gris-claro);
        }

        /* TABLA */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 25px;
            background-color: var(--blanco);
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 12px;
            text-align: center;
            color: #333;
        }

        th {
            background-color: var(--turquesa-oscuro);
            color: white;
            font-weight: 600;
        }

        tr:nth-child(even) {
            background-color: #f3fefe;
        }

        tr:hover {
            background-color: #dff7f4;
        }
    </style>
</head>

<body>

    <%@ include file="header.jsp" %>

    <section class="contenido-principal">
        <div class="contenido-centro">
            <h1>Registro de Matrículas</h1>
        </div>

        <div class="formulario-contacto">

            <!-- BOTÓN X -->
            <a href="index.jsp" class="cerrar">X</a>

            <h2 style="text-align:center; color:white; font-family:'Playfair Display',serif;">
                Listado de Matrículas
            </h2>

            <!-- TABLA -->
            <table>
                <thead>
                    <tr>
                        <th>ID Usuario</th>
                        <th>Categoría</th>
                        <th>Precio (S/)</th>
                        <th>Fecha</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="m" items="${listaMatriculas}">
                        <tr>
                            <td>${m.usuario_id}</td>
                            <td>${m.categoria_id}</td>
                            <td>${m.categoria_precio}</td>
                            <td>${m.fechaCreacion}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

        </div>
    </section>

    <%@ include file="footer.jsp" %>

</body>
</html>