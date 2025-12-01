<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <style>
        :root {
            --turquesa: #2e3bc4;
            --turquesa-oscuro: #23559c;
            --blanco: #ffffff;
            --gris-suave: #f4f4f4;
            --acento: #000000;
        }

        /* ============================ */
        /* ENCABEZADO */
        /* ============================ */
        header.encabezado {
            position: sticky;
            top: 0;
            z-index: 1000;
            background: var(--turquesa);
            border-bottom: 3px solid rgba(0, 0, 0, 0.1);
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.15);
        }

        .contenedor {
            max-width: 1500px;
            margin: 0 auto;
            padding: 18px 24px;
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .marca {
            font-family: "Poppins", sans-serif;
            font-weight: 700;
            color: var(--blanco);
            font-size: 22px;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            text-decoration: none;
        }

        nav.navegacion {
            margin-left: auto;
        }

        nav.navegacion ul {
            display: flex;
            gap: 24px;
            list-style: none;
            margin: 0;
            padding: 0;
        }

        nav.navegacion a {
            color: var(--blanco);
            font-size: 14px;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: .07em;
            opacity: .9;
            transition: color 0.2s ease, opacity 0.2s ease;
            text-decoration: none;
        }

        nav.navegacion a:hover {
            opacity: 1;
            color: var(--acento);
        }

        /* ICONOS Y USUARIO */
        .usuario-contenedor{
            display: flex;
            align-items: center;
            gap: 15px;
            margin-left: 25px;
        }

        .usuario-info {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .usuario-nombre {
            color: var(--blanco);
            font-size: 14px;
            font-weight: 500;
        }

        .usuario-rol {
            background: rgba(255, 255, 255, 0.2);
            padding: 4px 10px;
            border-radius: 12px;
            font-size: 12px;
            color: var(--blanco);
            font-weight: 600;
        }

        .icono-btn{
            background: none;
            border: none;
            cursor: pointer;
            padding: 0;
            color: var(--blanco);
            transition: opacity 0.2s ease, transform 0.2s ease;
            display: flex;
            align-items: center;
        }

        .icono-btn:hover{
            opacity: 0.8;
            transform: scale(1.1);
        }

        .icono-btn svg{
            fill: var(--blanco);
        }

        /* RESPONSIVO */
        @media (max-width: 768px) {
            .contenedor {
                flex-wrap: wrap;
                justify-content: center;
                text-align: center;
            }

            nav.navegacion ul {
                flex-wrap: wrap;
                justify-content: center;
                gap: 14px;
            }

            .marca {
                font-size: 20px;
            }

            .usuario-info {
                flex-direction: column;
                gap: 5px;
            }
        }
    </style>
</head>

<!-- ENCABEZADO -->
<header class="encabezado">
    <div class="contenedor">
        <a href="/principal/index" class="marca">Technology Schools</a>

        <nav class="navegacion">
            <ul>
                <li><a href="/principal/eventos">Eventos</a></li>
                <li><a href="/principal/nosotros">Nosotros</a></li>
                <li><a href="/principal/contacto">Contáctanos</a></li>

                
                 <c:if test="${not empty sessionScope.usuarioLogueado && sessionScope.usuarioLogueado.rol.id == 2}">
                 <li><a href="/principal/solicitudes">Solicitudes</a></li>
                 </c:if>

                <!-- Solo mostrar "Asistencias" si hay sesión activa -->
                <c:if test="${not empty sessionScope.usuarioLogueado}">
                    <li><a href="/principal/asistencias">Asistencias</a></li>
                </c:if>
            </ul>
        </nav>

        <div class="usuario-contenedor">
            <!-- Si hay sesión activa -->
            <c:if test="${not empty sessionScope.usuarioLogueado}">
                <div class="usuario-info">
                    <span class="usuario-nombre">${sessionScope.usuarioLogueado.nombre}</span>
                    <span class="usuario-rol">${sessionScope.usuarioLogueado.rol.nombre}</span>
                </div>

                <!-- Botón de logout -->
                <a href="/usuario/logout" class="icono-btn" title="Cerrar sesión">
                    <svg xmlns="http://www.w3.org/2000/svg" height="22px" viewBox="0 0 16 16" width="22px">
                        <path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8A1.5 1.5 0 0 1 0 11.5v-7A1.5 1.5 0 0 1 1.5 3h8a.5.5 0 0 1 .5.5v2a.5.5 0 1 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a.5.5 0 0 0 .5-.5z" />
                        <path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708z" />
                    </svg>
                </a>
            </c:if>

            <!-- Si no hay sesión -->
            <c:if test="${empty sessionScope.usuarioLogueado}">
                <a href="/principal/login" class="icono-btn" title="Iniciar sesión">
                    <svg xmlns="http://www.w3.org/2000/svg" width="22px" height="22px" fill="currentColor" viewBox="0 0 16 16">
                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                        <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"/>
                    </svg>
                </a>
            </c:if>
        </div>
    </div>
</header>