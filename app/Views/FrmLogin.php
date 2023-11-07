<!DOCTYPE html>
<html lang="es">

<head>
  <!-- Configuración del documento -->
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE-edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="icon" href="public/assets/logo.ico">

  <!-- Hojas de estilo y fuentes -->
  <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Poppins:400,500,600,700" rel="stylesheet">
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

  <!-- Título de la página -->
  <title class="text-center text-3xl font-poppins">Sistema de incidencias - Login</title>
</head>

<body class="bg-gray-200">
  <!-- Contenedor principal de la página de inicio de sesión -->
  <div class="flex justify-center items-center h-screen">
    <div class="container-login bg-white p-10 rounded-lg shadow-lg flex w-full max-w-screen-lg">
      <!-- Panel de video -->
      <div class="w-1/2 relative hidden md:block">
        <!-- Imagen de fondo o video -->
        <img src="public/assets/image.png" alt="imagen de mde" class="img_logo_login mx-auto max-w-xs pt-5">
      </div>

      <!-- Panel del formulario -->
      <div class="formDiv w-full md-w-1/2 p-4 justify-center items-center">
        <!-- Encabezado y logo -->
        <div class="headerDiv text-center">
          <h3 class="text-2xl font-bold p-5 font-poppins">Sistema de Incidencias</h3>
        </div>

        <!-- Formulario de inicio de sesión -->
        <form action="index.php?action=login" method="POST" class="form w-full max-w-sm">
          <!-- Campos de entrada para usuario y contraseña -->
          <div class="inputDiv mb-4">
            <label for="username" class="block text-lg font-semibold mb-2">Usuario</label>
            <div class="input flex items-center border rounded p-2">
              <i class='bx bxs-user icon-input icon text-gray-400 text-lg mr-2'></i>
              <input type='text' id='username' placeholder='Ingrese su usuario' name='username' required autofocus class="w-full outline-none text-lg font-poppins">
            </div>
          </div>
          <div class="inputDiv mb-4">
            <label for="password" class="block text-lg font-semibold mb-2">Contraseña</label>
            <div class="input flex items-center border rounded p-2">
              <i class="bx bxs-lock icon-input icon text-gray-400 text-lg mr-2"></i>
              <input type="password" id="password" placeholder="Ingrese su contraseña" name="password" required class="w-full outline-none text-lg font-poppins">
              <!-- Icono para mostrar/ocultar contraseña (cursor de mano) -->
              <div id="togglePassword" class="show-hide-link icon cursor-pointer">
                <i class="bx bx-show icon text-gray-400 text-lg"></i>
              </div>
            </div>
          </div>

          <!-- Botón de inicio de sesión -->
          <button type='submit' class='btn btn-form w-full py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-700 mt-5' name='btnIniciarSesion' content='Iniciar Sesi&oacute;n'>
            <span class="text-xl">Iniciar Sesi&oacute;n</span>
          </button>
        </form>
      </div>
    </div>
  </div>
</body>

</html>