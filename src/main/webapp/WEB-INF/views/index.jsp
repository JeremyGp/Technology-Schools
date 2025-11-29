<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="es">

        <head>
            <meta charset="utf-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1" />
            <title>Colegio Techonology Schools — Inicio</title>

            <!-- Tipografías (usa Playfair Display para títulos y Poppins para textos) -->
            <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
        <style>
            /* ======= ESTILO GENERAL ======= */
            body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background-color: #f7f9fb;
            color: #333;
            line-height: 1.6;
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

            /* ======= SECCIÓN HERO ======= */
            .hero {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: center;
            background: linear-gradient(120deg, #0f3ba9 30%, #25d0d0 90%);
            color: white;
            padding: 80px 20px;
            }

            .hero-izq-container {
            max-width: 500px;
            margin-right: 30px;
            }

            .hero-izq h1 {
            font-family: 'Playfair Display', serif;
            font-size: 2.8rem;
            margin-bottom: 10px;
            }

            .hero-izq-text p {
            font-size: 1.1rem;
            margin-bottom: 25px;
            }

            .boton-principal {
            background-color: white;
            color: #0fa9a7;
            padding: 12px 28px;
            border-radius: 25px;
            text-decoration: none;
            font-weight: 600;
            transition: background 0.3s, color 0.3s;
            }

            .boton-principal:hover {
            background-color: #007c7a;
            color: white;
            }

            .imagen-hero img {
            max-width: 400px;
            border-radius: 20px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
            }

            /* ======= SECCIÓN SERVICIOS ======= */
            .servicios {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            padding: 70px 20px;
            background-color: white;
            }

            .servicios .izq {
            max-width: 500px;
            padding: 20px;
            }

            .servicios h2 {
            font-family: 'Playfair Display', serif;
            color: #0fa9a7;
            font-size: 2rem;
            margin-bottom: 10px;
            }

            .servicios p {
            color: #555;
            font-size: 1.05rem;
            }

            .servicios img {
            width: 400px;
            border-radius: 15px;
            margin: 20px;
            }

            /* ======= FUNCIONALIDADES ======= */
            .funcionalidades {
            text-align: center;
            padding: 80px 20px;
            background-color: #e8fdfd;
            }

            .funcionalidades .titulo {
            font-family: 'Playfair Display', serif;
            font-size: 2.2rem;
            color: #007c7a;
            margin-bottom: 10px;
            }

            .funcionalidades .linea {
            width: 80px;
            height: 4px;
            background-color: #0fa9a7;
            margin: 0 auto 40px auto;
            border-radius: 2px;
            }

            .rejilla-funcionalidades {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 30px;
            justify-items: center;
            }

            .tarjeta-funcion {
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            position: relative;
            transition: transform 0.3s ease;
            }

            .tarjeta-funcion:hover {
            transform: translateY(-8px);
            }

            .tarjeta-funcion img {
            width: 350px;
            height: 200px;
            object-fit: contain;
            background-color: #e8fdfd;
            padding: 20px;
            }

            .tarjeta-funcion a{
            text-decoration: none;
            }

            .overlay {
            padding: 15px;
            background-color: #0fa9a7;
            color: white;
            font-weight: 600;
            text-align: center;
            }

            .overlay small {
            display: block;
            font-weight: 400;
            margin-top: 5px;
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

            /* ======= RESPONSIVE ======= */
            @media (max-width: 768px) {
            .hero {
                flex-direction: column;
                text-align: center;
            }

            .hero-izq-container {
                margin: 0;
            }

            .imagen-hero img {
                margin-top: 30px;
            }

            .servicios {
                flex-direction: column;
                text-align: center;
            }

            .servicios img {
                width: 90%;
            }
            }

        </style>
        
        </head>
            <body>
            <!-- ENCABEZADO -->
            <%@ include file="header.jsp" %>

                <!-- SECCIÓN PRINCIPAL -->
                <section class="hero" id="inicio">
                    <div class="contenedor">
                        <div class="hero-izq-container">
                            <div class="hero-izq">
                                <h1>Bienvenidos al Colegio Techonology Schools</h1>
                            </div>
                            <div class="hero-izq-text">
                                <p>Una institución comprometida con la educación, la innovación y el desarrollo de nuestros estudiantes.</p>
                                <a class="boton-principal" href="/principal/nosotros">MÁS INFORMACIÓN</a>
                            </div>
                        </div>
                        <div class="hero-der">
                            <div class="imagen-hero">
                                <img src="https://scontent.flim28-2.fna.fbcdn.net/v/t39.30808-6/547640040_1318924976689650_4147441790717172795_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=833d8c&_nc_ohc=4GsCNYRc94oQ7kNvwGbLgWB&_nc_oc=AdmoTGE5N4Kjox3Wmj6W7UrT2k74_4hBk-Oi4zBIR-XtGbhrgabD14BCgVfF8QuaAcI&_nc_zt=23&_nc_ht=scontent.flim28-2.fna&_nc_gid=AQ8H_POKYzImPpqa-iKiEg&oh=00_AfeJhfHfHmeEqlRaonYCmTgBhQGEAPENHXcg3Mr-4o2-Ww&oe=69004FB2"
                                    alt="Aula de clases">
                            </div>
                        </div>
                    </div>
                </section>

                <!-- SECCIÓN DE SERVICIOS EDUCATIVOS -->
                <section class="servicios">
                    <div class="izq">
                        <h2>Innovación en el Aprendizaje</h2>
                        <p>Nuestra plataforma digital facilita la asistencia, las matrículas y el seguimiento académico de estudiantes y docentes.</p>
                    </div>
                </section>

                <!-- SECCIÓN DE FUNCIONALIDADES -->
                <section class="funcionalidades" id="funcionalidades">
                    <div class="titulo">FUNCIONALIDADES</div>
                    <div class="linea"></div>
                    <div class="rejilla-funcionalidades">

                        <div class="tarjeta-funcion">
                            <a href="/asistencia/vista">
                                <img src="https://cdn-icons-png.flaticon.com/512/3246/3246816.png" alt="Asistencia">
                                <div class="overlay">ASISTENCIAS<br><small>Control de ingreso de alumnos y docentes</small></div>
                            </a>
                        </div>

                        <div class="tarjeta-funcion">
                            <a href="/principal/">
                                <img src="https://cdn-icons-png.flaticon.com/512/3597/3597075.png" alt="Matrículas">
                                <div class="overlay">MATRÍCULAS<br><small>Registro de nuevos estudiantes</small></div>
                            </a>
                        </div>

                    </div>
                </section>

                <!-- PIE -->
                <%@ include file="footer.jsp" %>

        </body>

        </html>