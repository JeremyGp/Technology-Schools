<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio de Sesión | Colegio Technology Schools</title>
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
            width: 380px;
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
            padding: 40px 35px;
            box-sizing: border-box;
        }

        .formulario .codigo,
        .formulario .password {
            position: relative;
            margin-bottom: 30px;
        }

        .formulario input[type="text"],
        .formulario input[type="password"] {
            width: 90%;
            padding: 12px;
            font-size: 16px;
            border: 2px solid var(--gris);
            border-radius: 8px;
            outline: none;
            transition: all 0.3s ease;
        }

        .formulario input:focus {
            border-color: var(--principal);
            box-shadow: 0 0 8px rgba(0, 166, 166, 0.3);
        }

        input[type="submit"] {
            width: 100%;
            padding: 14px;
            border: none;
            background: var(--principal);
            border-radius: 30px;
            font-size: 18px;
            color: var(--blanco);
            cursor: pointer;
            transition: background 0.3s ease;
        }

        input[type="submit"]:hover {
            background: #008080;
        }

        .registrarse {
            margin-top: 20px;
            text-align: center;
            font-size: 15px;
            color: var(--texto);
        }

        .registrarse a {
            color: var(--principal);
            text-decoration: none;
            font-weight: 600;
        }

        .registrarse a:hover {
            text-decoration: underline;
        }

        .error-msg {
            text-align: center;
            color: red;
            font-size: 14px;
            margin-bottom: 10px;
            background-color: #ffe6e6;
            padding: 10px;
            border-radius: 8px;
        }

        .cerrar {
            position: absolute;
            top: 20px;
            right: 25px;
            text-decoration: none;
            font-size: 28px;
            color: var(--texto);
        }

        .cerrar svg:hover {
            fill: red;
            transition: 0.3s;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.95); }
            to { opacity: 1; transform: scale(1); }
        }

        footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            background-color: var(--principal);
            color: var(--blanco);
            text-align: center;
            padding: 10px;
            font-size: 13px;
        }
    </style>
</head>
<body>

    <div class="formulario">
        <h1>Inicio de Sesión</h1>

        <!-- Mostrar mensaje de error si existe -->
        <c:if test="${not empty error}">
            <div class="error-msg">
                ${error}
            </div>
        </c:if>

        <!-- Formulario HTML estandar (sin Spring Form tags) -->
        <form action="/usuario/login" method="post">
            <div class="codigo">
                <input type="text"
                       name="codigo"
                       id="codigo"
                       placeholder="Código"
                       required
                       autocomplete="off"/>
            </div>
            <div class="password">
                <input type="password"
                       name="contrasena"
                       id="contrasena"
                       placeholder="Contraseña"
                       required/>
            </div>
            <input type="submit" value="Ingresar">
            <div class="registrarse">
                ¿No tienes cuenta? <a href="/principal/registrar">Regístrate aquí</a>
            </div>
        </form>
    </div>

    <a class="cerrar" href="/principal/index">
        <svg xmlns="http://www.w3.org/2000/svg" height="36px" viewBox="0 -960 960 960" width="36px" fill="#333">
            <path d="m256-200-56-56 224-224-224-224 56-56
                     224 224 224-224 56 56-224 224 224 224-56 56
                     -224-224-224 224Z" />
        </svg>
    </a>

    <footer>
        © 2025 Colegio Technology Schools — Todos los derechos reservados
    </footer>

</body>
</html>