<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Technology Schools — Gestión de Asistencias</title>

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

    .btn-registrar{
      background: var(--turquesa);
      color: var(--blanco);
      padding: 12px 24px;
      border-radius: 8px;
      border: none;
      cursor: pointer;
      font-weight: 600;
      font-size: 16px;
      margin-top: 20px;
      transition: background 0.3s ease;
    }

    .btn-registrar:hover{
      background: var(--turquesa-oscuro);
    }

    .select-estado{
      padding: 8px 12px;
      border: 2px solid var(--gris-claro);
      border-radius: 6px;
      font-size: 14px;
      outline: none;
      transition: border-color 0.3s ease;
    }

    .select-estado:focus{
      border-color: var(--turquesa);
    }

    @media (max-width:600px){
      .encabezado-seccion h1{ font-size:1.5rem; }
    }
  </style>
</head>

<body>

  <%@ include file="header.jsp" %>

  <section class="encabezado-seccion">
    <h1>Registro de Asistencias</h1>
    <p>Gestiona la asistencia diaria de los estudiantes.</p>
    <c:if test="${sessionScope.usuarioLogueado != null}">
      <p><strong>Docente: ${sessionScope.usuarioLogueado.nombre}</strong></p>
    </c:if>
  </section>

  <div class="contenedor">
    <div class="card-info">
      <h3>Panel de Control Docente</h3>
      <p>Desde aquí puedes registrar y consultar la asistencia de tus estudiantes.</p>
      <p><strong>Fecha:</strong> <span id="fecha-actual"></span></p>
    </div>

    <!-- Formulario de registro (ejemplo) -->
    <form action="/asistencia/guardar" method="post">
      <table class="tabla-asistencias">
          <thead>
              <tr>
                  <th>ID</th>
                  <th>Nombre del Estudiante</th>
                  <th>Código</th>
                  <th>Estado</th>
              </tr>
          </thead>
          <tbody>
              <c:forEach var="alumno" items="${alumnos}">
                  <tr>
                      <td>${alumno.id}</td>
                      <td>${alumno.nombre}</td>
                      <td>${alumno.codigo}</td>
                      <td>
                          <select class="select-estado" name="estado_${alumno.id}">
                            <option value="Presente" ${alumno.estadoAsistencia == 'Presente' ? 'selected' : ''}>Presente</option>
                            <option value="Tarde" ${alumno.estadoAsistencia == 'Tarde' ? 'selected' : ''}>Tardanza</option>
                            <option value="Ausente" ${alumno.estadoAsistencia == 'Ausente' ? 'selected' : ''}>Ausente</option>
                            <option value="Justificado" ${alumno.estadoAsistencia == 'Justificado' ? 'selected' : ''}>Justificado</option>
                        </select>
                          <input type="hidden" name="idAlumno" value="${alumno.id}">
                      </td>
                  </tr>
              </c:forEach>
          </tbody>
      </table>
      <button type="submit" class="btn-registrar">Guardar Asistencias</button>
  </form>

  </div>

  <%@ include file="footer.jsp" %>

  <script>
    // Mostrar fecha actual
    const fecha = new Date();
    const opciones = { year: 'numeric', month: 'long', day: 'numeric' };
    document.getElementById('fecha-actual').textContent = fecha.toLocaleDateString('es-PE', opciones);
  </script>

</body>
</html>