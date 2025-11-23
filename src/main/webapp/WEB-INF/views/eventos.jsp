<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Colegio Technology Schools — Eventos</title>

    <!-- Tipografías -->
    <link
        href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Poppins:wght@300;400;600&display=swap"
        rel="stylesheet">

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

        /* --- ESTILOS DE EVENTOS --- */
        .eventos {
            padding: 60px 20px;
            background-color: #f5f9fa;
            text-align: center;
        }

        .eventos h3 {
            font-family: 'Playfair Display', serif;
            font-size: 2.2rem;
            margin-bottom: 15px;
            color: #008c9e;
        }

        .intro-eventos {
            font-family: 'Poppins', sans-serif;
            font-size: 1rem;
            max-width: 700px;
            margin: 0 auto 40px;
            color: #333;
            line-height: 1.6;
        }

        /* Rejilla de eventos */
        .rejilla-eventos {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 30px;
            margin-top: 30px;
        }

        .item-evento {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 140, 158, 0.15);
            padding: 20px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .item-evento:hover {
            transform: translateY(-6px);
            box-shadow: 0 6px 12px rgba(0, 140, 158, 0.25);
        }

        .item-evento img {
            width: 100%;
            height: 400px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 15px;
        }

        .item-evento h4 {
            font-family: 'Playfair Display', serif;
            font-size: 1.3rem;
            margin: 10px 0;
            color: #006f80;
        }

        .item-evento p {
            font-family: 'Poppins', sans-serif;
            font-size: 0.95rem;
            color: #555;
            line-height: 1.5;
        }

        /* Video institucional */
        .video-eventos {
            padding: 60px 20px;
            background-color: #e9f7f8;
            text-align: center;
        }

        .video-eventos h3 {
            font-size: 2rem;
            margin-bottom: 15px;
            color: #008c9e;
            font-family: 'Playfair Display', serif;
        }

        .video-eventos p {
            max-width: 700px;
            margin: 0 auto 30px;
            font-family: 'Poppins', sans-serif;
            color: #333;
            line-height: 1.6;
        }

        .contenedor-video {
            max-width: 900px;
            margin: 0 auto;
        }

        .video-box {
            position: relative;
            padding-bottom: 56.25%;
            height: 0;
            overflow: hidden;
            border-radius: 10px;
            box-shadow: 0 3px 6px rgba(0, 0, 0, 0.15);
        }

        .video-box iframe {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            border: none;
        }
    </style>
</head>

<body>

    <!-- ENCABEZADO -->
    <%@ include file="header.jsp" %>

    <!-- EVENTOS -->
    <section class="eventos" id="eventos">
        <h3>PRÓXIMOS EVENTOS ESCOLARES</h3>
        <p class="intro-eventos">
            Nuestro colegio promueve la formación integral de sus estudiantes a través de eventos culturales, deportivos y académicos que fortalecen la comunidad educativa.
        </p>

        <div class="rejilla-eventos">
            <div class="item-evento">
                <img src="https://scontent.flim28-2.fna.fbcdn.net/v/t39.30808-6/485019057_1383080449318157_7840963588689984618_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=833d8c&_nc_ohc=C-UgiGqTSVwQ7kNvwEXQAzZ&_nc_oc=AdnQtpCIDrhcZWhBlybSZKsVLaAwPHBW8Di66EJUlI5Y-HCjmdZZPYOQ_c85nUwRrVY&_nc_zt=23&_nc_ht=scontent.flim28-2.fna&_nc_gid=KUUOaWbjdeGbCGjphkM-Fg&oh=00_AffAjQVH7W5f95gzYZk75WuNSyOZezT_cTYsSqiR_9sNtA&oe=690048EB" 
                alt="Feria Empresarial">
                <h4>Feria Empresarial</h4>
                <p>Feria donde los estudiantes muestran sus capacidades de ventas de productos hacia un cliente específico</p>
            </div>

            <div class="item-evento">
                <img src="https://scontent.flim28-2.fna.fbcdn.net/v/t39.30808-6/493106109_1258013746326502_96013375882686465_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=127cfc&_nc_ohc=BaE-R-N1wqMQ7kNvwEzqiLp&_nc_oc=Admo5M0cVPlF-Aaon7-BGLGEpN8RsDIJ0BD-D7d4l0_OJEcn1xIBO8d9tK48zn9JK8s&_nc_zt=23&_nc_ht=scontent.flim28-2.fna&_nc_gid=73DKD_sSgivloFticurrXQ&oh=00_AfcD7fDZrCpgmjUC9aiv1MuzhD6DUyhAR5AVZMnUy9YXzg&oe=6900779F" 
                alt="Campeonato Deportivo">
                <h4>Campeonato Deportivo</h4>
                <p>Participa en fútbol, vóley, básquet y atletismo representando a tu aula. La disciplina y el trabajo en equipo son la clave para la victoria.</p>
            </div>

            <div class="item-evento">
                <img src="https://scontent.flim38-1.fna.fbcdn.net/v/t39.30808-6/489088931_1241348567993020_9001338763575318830_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=127cfc&_nc_ohc=tuYVuCfCyd0Q7kNvwGIuH4S&_nc_oc=AdnKFX-VuiY52QiJdkHRQVHS5E7PG_-4OXxPDqUgiMdNAo_uuB3aaFOKbs2_GSMtVBY&_nc_zt=23&_nc_ht=scontent.flim38-1.fna&_nc_gid=MRSva7UtUraZiYe7y-tB7g&oh=00_AfdzdAexAompK3zsHxMuhIfPaiE0GPco3SYF_H15cJoibA&oe=690074C4" 
                alt="Semana del Logro">
                <h4>Semana del Logro</h4>
                <p>Los estudiantes presentan proyectos que integran creatividad, tecnología y sostenibilidad. ¡Una oportunidad para descubrir futuros científicos!</p>
            </div>

            <div class="item-evento">
                <img src="https://scontent.flim33-1.fna.fbcdn.net/v/t39.30808-6/515734414_1153831163432385_4499082533611556861_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=127cfc&_nc_ohc=BHTsGnv7CEwQ7kNvwFpU6Wf&_nc_oc=AdkQrKn9OwmP2UDiM--FY_oklnMQvXt9C1afpxBvX2MRTmvevk0xdkVZMQgK84iks-w&_nc_zt=23&_nc_ht=scontent.flim33-1.fna&_nc_gid=EAfPEGP354nbRFsfPY5Flw&oh=00_Afcly-XLohbjw4mG88bMDViOdnftNaffnk7FLbOaEqM-MA&oe=690074E9" 
                alt="Feria Vocacional">
                <h4>Feria Vocacional</h4>
                <p>Diferentes universidades e institutos vienen a exponer sobre las distintas carreras que tienen, donde el estudiante podrá recibir información de su futuro lugar de estudio</p>
            </div>

            <div class="item-evento">
                <img src="https://scontent.flim38-1.fna.fbcdn.net/v/t39.30808-6/492587402_1258024479658762_8858177421608316575_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=127cfc&_nc_ohc=2491PTvuUGUQ7kNvwF37BSn&_nc_oc=Adn_eueZEwpZVATqbrm9LJn-l2Duu9kDzOmYsbRiVzftrdM7HmgtH-TuU_J0EZZMAEI&_nc_zt=23&_nc_ht=scontent.flim38-1.fna&_nc_gid=c4TsNNhHJWbGXZPeTISfBw&oh=00_Afdz000oPMm2TITnvPbv3Pp6ekFFZLtJhKIIo7Ne3dr2-g&oe=69005334" 
                alt="Semana de Aniversario">
                <h4>Semana de Aniversario</h4>
                <p>Una semana donde los estudiantes podrán participar en concursos entre aulas, danzas y distintos juegos por el Aniversario del colegio.</p>
            </div>
        </div>
    </section>

    <!-- VIDEO INSTITUCIONAL -->
    <section class="video-eventos">
        <div class="contenedor-video">
            <h3>VIDA ESCOLAR EN EL COLEGIO TECHNOLOGY SCHOOLS</h3>
            <p>Conoce más sobre nuestras actividades y la formación integral que ofrecemos a nuestros estudiantes.</p>
            <div class="video-box">
                <iframe width="100%" height="480"
                    src="https://www.youtube.com/embed/GIgEkA3AiR0"
                    title="Colegio Techonology Schools - Video Institucional" frameborder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                    allowfullscreen>
                </iframe>
            </div>
        </div>
    </section>

    <!-- PIE -->
    <%@ include file="footer.jsp" %>

</body>
</html>
