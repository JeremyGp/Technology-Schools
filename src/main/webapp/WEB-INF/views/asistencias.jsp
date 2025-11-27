<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Technology Schools — Asistencias de Alumnos</title>

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

    .card-info{
      background: var(--card-bg);
      border-radius: var(--radio);
      box-shadow: 0 8px 20px var(--sombra);
      padding: 30px;
      margin-bottom: 30px;
    }

    .card-info h3{
      font-family: "Playfair Display", serif;
      color: var(--turquesa-oscuro);
      margin-top: 0;
    }

    .tabla-asistencias{
      width: 100%;
      border-collapse: collapse;
      background: var(--blanco);
      border-radius: var(--radio);
      overflow: hidden;
      box-shadow: 0 4px 12px var(--sombra);
    }

    .tabla-asistencias thead{
      background: linear-gradient(90deg, var(--turquesa), var(--turquesa-oscuro));
      color: var(--blanco);
    }

    .tabla-asistencias th{
      padding: 15px;
      text-align: left;
      font-weight: 600;
    }

    .tabla-asistencias td{
      padding: 12px 15px;
      border-bottom: 1px solid #e0e0e0;
    }

    .tabla-asistencias tbody tr:hover{
      background-color: rgba(46,196,182,0.05);
    }

    .estado-presente{
      color: #28a745;
      font-weight: 600;
    }

    .estado-tarde{
      color: #ffc107;
      font-weight: 600;
    }

    .estado-ausente{
      color: #dc3545;
      font-weight: 600;
    }

    .estado-justificado{
      color: #17a2b8;
      font-weight: 600;
    }

    .mensaje-info{
      text-align: center;
      padding: 40px 20px;
      color: #2f5f5a;
      background: var(--blanco);
      border-radius: var(--radio);
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
    <h1>Mis Asistencias</h1>
    <p>Consulta tu historial de asistencia del ciclo académico actual.</p>
    <c:if test="${sessionScope.usuarioLogueado != null}">
      <p><strong>Alumno: ${sessionScope.usuarioLogueado.nombre}</strong></p>
    </c:if>
  </section>

  <div class="contenedor">
    <div class="card-info">
      <h3>Resumen de Asistencias</h3>
      <p><strong>Código:</strong> ${sessionScope.usuarioLogueado.codigo}</p>
      <p><strong>Email:</strong> ${sessionScope.usuarioLogueado.email}</p>
      <p>Aquí podrás revisar tu historial de asistencias, tardanzas y justificaciones.</p>
    </div>

    <!-- Tabla de ejemplo - Luego conectarás con backend real -->
    <table class="tabla-asistencias">
      <thead>
        <tr>
          <th>Fecha</th>
          <th>Hora</th>
          <th>Estado</th>
          <th>Observación</th>
        </tr>
      </thead>
      <tbody>
        <!-- Datos de ejemplo - Reemplazar con datos reales del backend -->
        <tr>
          <td>26/11/2025</td>
          <td>08:00 AM</td>
          <td><span class="estado-presente">Presente</span></td>
          <td>-</td>
        </tr>
        <tr>
          <td>25/11/2025</td>
          <td>08:15 AM</td>
          <td><span class="estado-tarde">Tardanza</span></td>
          <td>Llegó 15 minutos tarde</td>
        </tr>
        <tr>
          <td>24/11/2025</td>
          <td>-</td>
          <td><span class="estado-ausente">Ausente</span></td>
          <td>No asistió</td>
        </tr>
        <tr>
          <td>23/11/2025</td>
          <td>-</td>
          <td><span class="estado-justificado">Justificado</span></td>
          <td>Cita médica</td>
        </tr>
      </tbody>
    </table>
  </div>

  <%@ include file="footer.jsp" %>

</body>
</html>