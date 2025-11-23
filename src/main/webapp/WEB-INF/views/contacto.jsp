<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Technology Schools — Contacto</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">

    <!-- Tipografías -->
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <style>
        :root {
            --turquesa: #2ec4b6;
            --turquesa-oscuro: #239c91;
            --gris-claro: #e9f9f8;
            --blanco: #ffffff;
            --acento: #ffcb77;
            --radio: 12px;
            --maxw: 1200px;
        }

        body {
            margin: 0;
            font-family: "Poppins", sans-serif;
            background-color: var(--gris-claro);
            color: #222;
        }

        /* ======= ENCABEZADO ======= */
            header {
            padding: 15px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            }

            header h1 {
            font-family: 'Playfair Display', serif;
            font-weight: 700;
            font-size: 1.8rem;
            }

            header nav a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
            font-weight: 500;
            transition: color 0.3s ease;
            }

            header nav a:hover {
            color: #e6fffa;
            }

        /* ======= PIE DE PÁGINA ======= */
            footer {
            color: white;
            text-align: center;
            padding: 20px 0;
            font-size: 0.9rem;
            }

            footer a {
            color: #c7ffff;
            text-decoration: none;
            }

            footer a:hover {
            text-decoration: underline;
            }

        /* ======= PIE DE PÁGINA ======= */
            footer {
            color: white;
            text-align: center;
            padding: 20px 0;
            font-size: 0.9rem;
            }

            footer a {
            color: #c7ffff;
            text-decoration: none;
            }

            footer a:hover {
            text-decoration: underline;
            }

        /* Carrusel */
        .carrusel img {
            width: 100%;
            height: 340px;
            object-fit: cover;
        }

        /* ============================ */
        /* CONTENIDO PRINCIPAL */
        /* ============================ */
        .contenido-principal {
            padding: 80px 20px;
            background: var(--gris-claro);
            text-align: center;
        }

        .contenido-centro h1 {
            font-family: "Playfair Display", serif;
            font-size: 36px;
            color: var(--turquesa-oscuro);
            margin-bottom: 10px;
        }

        .contenido-centro p {
            font-size: 18px;
            color: #444;
            margin-bottom: 40px;
        }

        /* ============================ */
        /* FORMULARIO DE CONTACTO */
        /* ============================ */
        .formulario-contacto {
            background: linear-gradient(145deg, var(--turquesa), var(--turquesa-oscuro));
            padding: 40px;
            max-width: 600px;
            margin: 0 auto;
            border-radius: var(--radio);
            color: var(--blanco);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        }

        .formulario-contacto h2 {
            font-family: "Playfair Display", serif;
            font-size: 28px;
            text-align: center;
            margin-bottom: 25px;
            color: var(--blanco);
        }

        .formulario-contacto form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .formulario-contacto label {
            text-align: left;
            font-weight: 600;
            font-size: 15px;
        }

        .formulario-contacto input,
        .formulario-contacto textarea {
            padding: 10px;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            font-family: "Poppins", sans-serif;
        }

        .formulario-contacto textarea {
            resize: none;
        }

        .formulario-contacto button {
            background: var(--blanco);
            color: #333;
            border: none;
            border-radius: 8px;
            padding: 12px;
            font-weight: 600;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .formulario-contacto button:hover {
            background: var(--gris-claro);
        }

        /* ============================ */
        /* RESPONSIVE */
        /* ============================ */
        @media (max-width: 768px) {
            .formulario-contacto {
                padding: 30px 20px;
            }

            .contenido-centro h1 {
                font-size: 28px;
            }
        }
    </style>
</head>

<body>

    <%@ include file="header.jsp" %>


    <!-- Contenido principal -->
    <section class="contenido-principal">   
        <div class="contenido-centro">
            <h1>Contáctanos</h1>
            <p>¿Tienes dudas o deseas más información? En Technology Schools estaremos encantados de atenderte.</p>
        </div>

        <div class="formulario-contacto">
            <h2>Envíanos un mensaje</h2>
            <form>
                <label for="nombre">Nombre completo:</label>
                <input type="text" id="nombre" name="nombre" placeholder="Tu nombre" required>

                <label for="email">Correo electrónico:</label>
                <input type="email" id="email" name="email" placeholder="Tu correo" required>

                <label for="asunto">Asunto:</label>
                <input type="text" id="asunto" name="asunto" placeholder="Motivo del mensaje" required>

                <label for="mensaje">Mensaje:</label>
                <textarea id="mensaje" name="mensaje" rows="4" placeholder="Escribe tu mensaje aquí..." required></textarea>

                <button type="submit">Enviar mensaje</button>
            </form>
        </div>
    </section>

    <%@ include file="footer.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
