<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Matrícula | Colegio Technology Schools</title>

    <style>
        :root {
            --principal: #004ba6;
            --secundario: #e0f7f7;
            --texto: #003333;
            --blanco: #fff;
            --gris: #ddd;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(120deg, #0f3ba9 30%, #25d0d0 90%);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .formulario {
            width: 450px;
            background-color: var(--blanco);
            border-radius: 15px;
            box-shadow: 0px 6px 20px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            animation: fadeIn 0.7s ease-in-out;
        }

        .formulario h1 {
            text-align: center;
            background-color: var(--principal);
            color: var(--blanco);
            margin: 0;
            padding: 20px 0;
            font-weight: 600;
        }

        .formulario form {
            padding: 30px;
        }

        .formulario .campo {
            margin-bottom: 22px;
        }

        .formulario input, .formulario select {
            width: 95%;
            padding: 12px;
            border: 2px solid var(--gris);
            border-radius: 8px;
            outline: none;
            font-size: 15px;
            transition: 0.3s ease;
        }

        .formulario input:focus, .formulario select:focus {
            border-color: var(--principal);
            box-shadow: 0 0 8px rgba(0, 166, 166, 0.3);
        }

        input[type="submit"] {
            background: var(--principal);
            border: none;
            color: var(--blanco);
            font-size: 18px;
            cursor: pointer;
            border-radius: 30px;
            width: 100%;
            padding: 14px;
            margin-top: 10px;
        }

        input[type="submit"]:hover {
            background: #008080;
        }

        .info {
            text-align: center;
            color: var(--texto);
            margin-top: 12px;
        }

        .cerrar {
            position: absolute;
            top: 20px;
            right: 25px;
            text-decoration: none;
            font-size: 28px;
            color: var(--texto);
        }

        footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            background-color: var(--principal);
            color: var(--blanco);
            text-align: center;
            padding: 8px;
            font-size: 13px;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.95); }
            to { opacity: 1; transform: scale(1); }
        }
    </style>
</head>
<body>

<div class="formulario">
    <h1>Solicitud de Matrícula</h1>

    <form:form action="/matricula/registrar" method="post" modelAttribute="estudiante">

        <div class="campo">
            <form:input path="dni" type="text" placeholder="DNI / Documento" required="true" />
        </div>

        <div class="campo">
            <form:input path="nombres" type="text" placeholder="Nombres completos" required="true" />
        </div>

        <div class="campo">
            <form:input path="apellidos" type="text" placeholder="Apellidos completos" required="true" />
        </div>

        <div class="campo">
            <form:input path="email" type="email" placeholder="Correo electrónico" required="true" />
        </div>

        <div class="campo">
            <form:select path="grado" required="true">
                <option value="">Seleccionar grado</option>
                <option>Inicial (4-5 años)</option>
                <option>Primaria 1° - 6°</option>
                <option>Secundaria 1° - 5°</option>
            </form:select>
        </div>

        <input type="submit" value="Enviar solicitud">
        <div class="info">
            Nos comunicaremos contigo para continuar el proceso ✨
        </div>

    </form:form>
</div>

<footer>
    © 2025 Colegio Technology Schools — Todos los derechos reservados
</footer>

</body>
</html>
