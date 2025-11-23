<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Technology Schools — Nosotros</title>

   <!-- Tipografías (usa Playfair Display para títulos y Poppins para textos) -->
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --turquesa: #2ec4b6;
            --turquesa-oscuro: #239c91;
            --azul-profundo: #032b2f;
            --gris-claro: #e9f9f8;
            --blanco: #ffffff;
            --acento: #ffcb77;
            --maxw: 1200px;
            --radio: 12px;
        }

        body {
            margin: 0;
            background-color: var(--gris-claro);
            font-family: "Poppins", sans-serif;
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

        /* ============================ */
        /* SOBRE NOSOTROS */
        /* ============================ */
        .sobre {
            padding: 90px 20px;
            position: relative;
            overflow: hidden;
            background: linear-gradient(rgba(46, 196, 182, 0.8), rgba(35, 156, 145, 0.8)),
                url('https://images.unsplash.com/photo-1523580846011-d3a5bc25702b?auto=format&fit=crop&w=1600&q=80') center/cover no-repeat;
            color: var(--blanco);
        }

        .sobre .interior {
            max-width: var(--maxw);
            margin: 0 auto;
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: center;
            gap: 40px;
        }

        .sobre .tarjeta {
            background: rgba(255, 255, 255, 0.15);
            padding: 30px;
            border-radius: var(--radio);
            backdrop-filter: blur(10px);
            max-width: 600px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.25);
        }

        .sobre .tarjeta h4 {
            font-family: "Playfair Display", serif;
            font-size: 34px;
            color: var(--acento);
            margin-bottom: 12px;
        }

        .sobre .tarjeta p {
            line-height: 1.6;
            font-size: 17px;
            color: #f0f0f0;
        }

        .sobre .video {
            border-radius: 15px;
            overflow: hidden;
            max-width: 500px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
        }

        iframe {
            width: 100%;
            height: 320px;
            border: none;
        }

        /* ============================ */
        /* HISTORIA */
        /* ============================ */
        .historia {
            background: var(--blanco);
            text-align: center;
            padding: 80px 20px;
            color: #333;
        }

        .historia h3 {
            font-family: "Playfair Display", serif;
            font-size: 32px;
            color: var(--turquesa-oscuro);
            margin-bottom: 18px;
        }

        .historia p {
            max-width: 800px;
            margin: 0 auto;
            line-height: 1.7;
            font-size: 17px;
        }

        /* ============================ */
        /* VALORES */
        /* ============================ */
        .valores {
            background: var(--turquesa);
            color: var(--blanco);
            padding: 80px 20px;
            text-align: center;
        }

        .valores h3 {
            font-family: "Playfair Display", serif;
            font-size: 30px;
            margin-bottom: 25px;
        }

        .valores ul {
            list-style: none;
            padding: 0;
            max-width: 600px;
            margin: 0 auto;
            text-align: left;
        }

        .valores li {
            margin-bottom: 15px;
            font-size: 16px;
            position: relative;
            padding-left: 25px;
        }

        .valores li::before {
            content: "✔";
            position: absolute;
            left: 0;
            color: var(--acento);
            font-weight: bold;
        }

        /* ============================ */
        /* EQUIPO */
        /* ============================ */
        .equipo {
            background: var(--blanco);
            padding: 80px 20px;
            text-align: center;
        }

        .equipo h3 {
            font-family: "Playfair Display", serif;
            font-size: 30px;
            color: var(--turquesa-oscuro);
            margin-bottom: 30px;
        }

        .rejilla-equipo {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 40px;
        }

        .miembro {
            background: #f9f9f9;
            border-radius: var(--radio);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 250px;
            transition: transform 0.3s ease;
        }

        .miembro:hover {
            transform: translateY(-10px);
        }

        .miembro img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            margin-bottom: 12px;
        }

        .miembro h4 {
            font-size: 20px;
            color: var(--turquesa-oscuro);
            margin-bottom: 8px;
        }

        .miembro p {
            font-size: 14px;
            color: #555;
        }

        .acciones-finales {
            margin-top: 2rem;
        }

        .btn {
            padding: 10px 18px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            margin: 0 6px;
        }

        .btn-primary {
            background: var(--turquesa);
            color: var(--blanco);
        }

        .btn-secondary {
            background: var(--gris-claro);
            color: #333;
        }

        .btn:hover {
            opacity: 0.9;
        }
    </style>
</head>

<body>

    <%@ include file="header.jsp" %>

    <!-- SOBRE NOSOTROS -->
    <section class="sobre" id="sobre-nosotros">
        <div class="interior">
            <div class="tarjeta">
                <h4>Sobre Nosotros</h4>
                <p>Technology Schools es una institución educativa comprometida con la excelencia académica y la innovación digital. Nuestro objetivo es formar estudiantes capaces de desenvolverse con éxito en un mundo cada vez más tecnológico, brindando herramientas modernas y una enseñanza integral.</p>
            </div>
        </div>
    </section>

    <!-- NUESTRA HISTORIA -->
    <section class="historia" id="historia">
        <h3>NUESTRA HISTORIA</h3>
        <p>Fundado en Diciembre del 2014, Technology Schools nació con el propósito de de brindar una educación integral 
            a niños y jóvenes de la comunidad. Inició sus actividades como una sede con 640 estudiantes con un grupo de 
            20 docentes y 8 auxiliares comprometidos con la formación académica y en valores. Con el paso de los años, 
            la institución fue creciendo en infraestructura y matrícula, incorporando laboratorios, áreas deportivas y 
            programas de apoyo estudiantil. A lo largo de su trayectoria, el colegio ha mantenido como eje central la 
            excelencia educativa, fomentando la innovación pedagógica y la integración de nuevas tecnologías en el aula y 
            logrando superarse cada año con un número mayor de estudiantes matriculados. Gracias a este compromiso, ha logrado 
            consolidarse como una institución reconocida en la zona, destacándose por la calidad de sus docentes y su participación en proyectos sociales.
        </p>
    </section>

    <!-- NUESTROS VALORES -->
    <section class="valores" id="valores">
        <h3>NUESTROS VALORES</h3>
        <ul>
            <li><strong>Innovación:</strong> fomentamos el aprendizaje digital y el pensamiento crítico.</li>
            <li><strong>Compromiso:</strong> acompañamos el desarrollo académico y personal de cada estudiante.</li>
            <li><strong>Colaboración:</strong> promovemos el trabajo en equipo y la empatía.</li>
            <li><strong>Excelencia:</strong> buscamos la mejora continua en nuestros procesos educativos.</li>
        </ul>
    </section>

    <!-- EQUIPO -->
    <section class="equipo" id="equipo">
        <h3>NUESTRO EQUIPO</h3>
        <div class="rejilla-equipo">
            <div class="miembro">
                <img src="https://randomuser.me/api/portraits/women/65.jpg" alt="Directora">
                <h4>María Torres</h4>
                <p>Directora general. Líder apasionada por la innovación educativa.</p>
            </div>
            <div class="miembro">
                <img src="https://randomuser.me/api/portraits/men/50.jpg" alt="Profesor de Tecnología">
                <h4>Carlos Díaz</h4>
                <p>Coordinador de Tecnología. Promueve el uso de herramientas digitales en el aula.</p>
            </div>
            <div class="miembro">
                <img src="https://randomuser.me/api/portraits/women/72.jpg" alt="Docente de Ciencias">
                <h4>Ana Rodríguez</h4>
                <p>Docente de Ciencias. Impulsa el pensamiento científico y la curiosidad.</p>
            </div>
        </div>

        <div class="acciones-finales">
            <a href="/principal/eventos"><button class="btn btn-primary" type="button">Noticias y Eventos</button></a>
        </div>
    </section>

    <%@ include file="footer.jsp" %>

</body>

</html>
