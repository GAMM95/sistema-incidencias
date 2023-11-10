<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Importacion de iconos -->
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
  <title>Gestion de Incidencias</title>
</head>

<body>

  <!-- Contenedor principal -->
  <div class="mainContent !w-full">
    <!-- Incluir el encabezado desde un archivo externo -->
    <?php
    include("app/Views/Partials/header.php");
    ?>

    <section class="home">
      <div class="text">REGISTRAR INCIDENCIA
      </div>
      <div class="registrar_incidencia">
        <form action="#" method="POST">
          <div class="form first">
            <div class="details registrarincidencia">

              <div class="fields">
                <div class="input-field">
                  <label>Categoria</label>
                  <select required name="categoria" class="form-control">
                    <option disabled selected>Selectionar Categoria</option>
                    <?php
                    include("funciones/buscarCategoria.php");
                    ?>
                  </select>
                </div>
                <div class="input-field">
                  <label>LOCAL</label>
                  <select required name="local" id="id_local" class="form-control" onchange="recargarLista(this.value);">
                    <option disabled selected>Selectionar Local</option>
                    <?php
                    include("funciones/buscarLocal.php");
                    ?>
                  </select>
                </div>

                <div class="input-field">
                  <label>AREA</label>
                  <select id='select2lista' name="area">
                    <option disabled selected>Selectionar Area</option>
                  </select>
                </div>

                <div class="input-field">
                  <label>PRIORIDAD</label>
                  <select required name="prioridad" class="form-control">
                    <option disabled selected>Selectionar Prioridad</option>
                    <?php
                    include("funciones/buscarPrioridad.php");
                    ?>
                  </select>
                </div>

                <div class="input-field">
                  <label>Fecha</label>
                  <input type="datetime-local" name="fecha" placeholder="Ingrese la Fecha" required>
                </div>


                <div class="input-field">
                  <label>Estado</label>
                  <select name="estado" required>
                    <option selected value="Activo">Activo</option>
                  </select>
                </div>

                <div class="input-field">
                  <label>Codigo Patrimonial de Equipo</label>
                  <input type="text" name="equipo" placeholder="Ingresar Codigo Patrimonial" required>
                </div>
              </div>
            </div>

            <div class="Asunto ID">

              <div class="fields">
                <div class="input-field1">
                  <label>Asunto</label>
                  <input type="text" name="asunto" placeholder="Ingresar el Asunto" required>
                </div>
              </div>
            </div>

            <div class="Documento ID">
              <div class="fields">
                <div class="input-field1">
                  <label>Documento</label>
                  <input type="text" name="documento" placeholder="Ingresar Nombre del Documento" required>
                </div>
              </div>
            </div>

          </div>
        </form>
      </div>

    </section>

  </div>

</body>

</html>