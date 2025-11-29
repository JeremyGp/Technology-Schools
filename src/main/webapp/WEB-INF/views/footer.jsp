<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <style>
        :root {
            --turquesa: #2e3bc4;
            --turquesa-oscuro: #23559c;
            --blanco: #ffffff;
            --gris-claro: #e8f9f8;
            --acento: #000000;
        }

        /* ============================ */
        /* PIE DE PÁGINA */
        /* ============================ */
        footer.pie {
            background: var(--turquesa-oscuro);
            color: var(--blanco);
            padding: 28px 22px;
            border-top: 3px solid rgba(0, 0, 0, 0.1);
            box-shadow: 0 -2px 6px rgba(0, 0, 0, 0.15);
        }

        .pie-interno {
            max-width: 1300px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            flex-wrap: wrap;
            gap: 24px;
        }

        .pie-izq {
            font-family: "Poppins", sans-serif;
            font-weight: 500;
            color: var(--blanco);
            max-width: 400px;
        }

        .pie-izq div {
            font-size: 20px;
            font-weight: 700;
            margin-bottom: 6px;
            color: var(--blanco);
            letter-spacing: 0.5px;
        }

        .pie-izq small {
            display: block;
            color: var(--gris-claro);
            font-size: 13px;
            margin-top: 4px;
        }

        .pie-izq a {
            display: inline-block;
            margin-top: 8px;
            font-size: 13px;
            color: var(--blanco);
            text-decoration: underline;
            transition: color 0.2s ease;
        }

        .pie-izq a:hover {
            color: var(--acento);
        }

        /* Navegación derecha */
        .pie-der nav {
            display: flex;
            flex-wrap: wrap;
            gap: 18px;
            justify-content: flex-end;
        }

        .pie-der a {
            color: var(--blanco);
            text-transform: uppercase;
            font-size: 13px;
            letter-spacing: .07em;
            opacity: 0.9;
            transition: color 0.2s ease, opacity 0.2s ease;
        }

        .pie-der a:hover {
            color: var(--acento);
            opacity: 1;
            text-decoration: none;
        }

        /* ============================ */
        /* RESPONSIVO */
        /* ============================ */
        @media (max-width: 768px) {
            footer.pie {
                text-align: center;
            }

            .pie-interno {
                flex-direction: column;
                align-items: center;
                gap: 16px;
            }

            .pie-izq {
                max-width: 100%;
            }

            .pie-der nav {
                justify-content: center;
                gap: 12px;
            }
        }
    </style>
</head>

<footer class="pie">
    <div class="pie-interno">
        <div class="pie-izq">
            <div>Technology Schools</div>
            <small>© 2025 Todos los derechos reservados</small>
            <small>Desarrollado por el equipo de Innovación Digital</small>
        </div>

        <div class="pie-der">
            <nav>
                <a href="/principal/index#inicio">Inicio</a>
                <a href="/principal/eventos">Eventos</a>
                <a href="/principal/nosotros">Nosotros</a>
                <a href="/principal/contacto">Contáctanos</a>
            </nav>
        </div>
    </div>
</footer>
