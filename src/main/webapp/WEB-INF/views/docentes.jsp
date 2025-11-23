<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Technology Schools — Docentes</title>

  <!-- Tipografías -->
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

  <style>
    :root{
      --turquesa: #2ec4b6;
      --turquesa-oscuro: #239c91;
      --blanco: #ffffff;
      --gris-claro: #f5fbfb;
      --texto: #073638;
      --card-bg: #ffffff;
      --sombra: rgba(0,0,0,0.08);
      --radio: 12px;
      --maxw: 1200px;
    }

    body{
      margin:0;
      font-family: "Poppins", sans-serif;
      background: var(--gris-claro);
      color: var(--texto);
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
    
    .encabezado-seccion{
      background: linear-gradient(90deg, rgba(46,196,182,0.12), rgba(35,156,145,0.08));
      padding: 36px 20px;
      text-align: center;
    }

    .encabezado-seccion h1{
      margin:0;
      font-family: "Playfair Display", serif;
      color: var(--turquesa-oscuro);
      font-size: 2rem;
    }

    .encabezado-seccion p{
      margin:8px 0 0 0;
      color:#2f5f5a;
    }

    .contenedor{
      max-width: var(--maxw);
      margin: 36px auto;
      padding: 0 20px;
    }

    .rejilla-docentes{
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
      gap: 24px;
    }

    .card-docente{
      background: var(--card-bg);
      border-radius: var(--radio);
      box-shadow: 0 8px 20px var(--sombra);
      overflow: hidden;
      transition: transform .22s ease, box-shadow .22s ease;
      display:flex;
      flex-direction: column;
      min-height: 180px;
    }

    .card-docente:hover{
      transform: translateY(-6px);
      box-shadow: 0 16px 30px rgba(0,0,0,0.12);
    }

    .card-encabezado{
      padding: 18px 20px;
      background: linear-gradient(90deg, var(--turquesa), var(--turquesa-oscuro));
      color: var(--blanco);
    }

    .card-encabezado h3{
      margin: 0;
      font-family: "Playfair Display", serif;
      font-size: 1.2rem;
    }

    .card-cuerpo{
      padding: 18px 20px;
      flex:1;
      display:flex;
      flex-direction: column;
      gap: 10px;
    }

    .lista-cursos{
      display:flex;
      flex-wrap:wrap;
      gap:8px;
      margin: 0;
      padding: 0;
      list-style: none;
    }

    .curso-chip{
      display:inline-block;
      background: rgba(35,156,145,0.08);
      color: var(--turquesa-oscuro);
      border: 1px solid rgba(46,196,182,0.14);
      padding: 6px 10px;
      border-radius: 999px;
      font-size: 0.9rem;
    }

    .sin-cursos{
      color:#6b8f8d;
      font-size:0.95rem;
    }

    .acciones-card{
      margin-top:auto;
      display:flex;
      gap:10px;
      align-items:center;
    }

    .btn-ver{
      background: var(--turquesa);
      color: var(--blanco);
      padding: 8px 14px;
      border-radius: 8px;
      border: none;
      cursor: pointer;
      text-decoration: none;
      font-weight:600;
    }

    /* Fallback / mensaje vacío */
    .mensaje-vacio{
      text-align:center;
      padding: 40px 20px;
      color:#2f5f5a;
      background: #fff;
      border-radius: 12px;
      box-shadow: 0 8px 20px var(--sombra);
    }

    @media (max-width:600px){
      .encabezado-seccion h1{ font-size:1.5rem; }
    }
  </style>
</head>

<body>

  <%@ include file="header.jsp" %>

  <section class="encabezado-seccion">
    <h1>Asistencia de Docentes</h1>
    <p>Registra y consulta la asistencia diaria del personal docente de Technology Schools.</p>
  </section>

  <div class="contenedor">
    <c:choose>
      <c:when test="${empty docentes}">
        <div class="mensaje-vacio">
          <h3>No hay docentes registrados.</h3>
          <p>Por favor, agrega docentes antes de registrar asistencia.</p>
        </div>
      </c:when>

      <c:otherwise>
        <form action="/asistencia/guardar" method="post">
          <table>
            <thead>
              <tr>
                <th>ID</th>
                <th>Nombre del Docente</th>
                <th>Fecha</th>
                <th>Estado</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="docente" items="${docentes}">
                <tr>
                  <td>${docente.id}</td>
                  <td>${docente.nombre}</td>
                  <td><input type="date" name="fecha_${docente.id}" value="${fechaActual}" required></td>
                  <td>
                    <select name="estado_${docente.id}" class="asistencia-select" required>
                      <option value="Presente">Presente</option>
                      <option value="Tarde">Tarde</option>
                      <option value="Justificado">Justificado</option>
                      <option value="Ausente">Ausente</option>
                    </select>
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>

          <button type="submit" class="btn-guardar">Guardar Asistencia</button>
        </form>
      </c:otherwise>
    </c:choose>
  </div>

  <%@ include file="footer.jsp" %>

</body>
</html>
