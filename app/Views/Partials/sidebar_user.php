<!DOCTYPE html>
<html lang="es">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- Implementación de funcionalidades para la vista cliente -->
	<script src="app/Views/funciones/navbar.js"></script>

	<!-- Importacion de iconos -->
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
	<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
	<title>Gestión de Incidencias - Admin</title>

</head>

<body>
	<!-- Contenedor de la barra lateral -->
	<div class="sideBar hidden lg:block bg-gray-100 p-4">

		<!-- División para el logo -->
		<div class="logoDiv flex">
			<img src="public/assets/image.png" alt="Imagen logo MDE" class="img_logo">
		</div>

		<!-- División del menú -->
		<div class="menuDiv">
			<h3 class="divTitulo"></h3>
			<ul class="menuList grid gap-2">

				<!-- Item registrar incidencia -->
				<li class="listItem">
					<a href="tarjetas_de_circulacion.php" class="menuLink flex items-center space-x-2">
						<i class='bx bxs-id-card icon'></i>
						<span class="smallText">Registrar Incidencia</span>
					</a>
				</li>

				<!-- Item Consultar incidencia -->
				<li class="listItem">
					<a href="papeletas.php" class="menuLink flex items-center space-x-2">
						<i class='bx bxs-notepad icon'></i>
						<span class="smallText">Consultar Incidencia</span>
					</a>
				</li>

			</ul>
		</div>

		<!-- Botón de cierre de sesión -->
		<div class="menuDiv mt-auto">
			<button class="btn !shadow-2xl logout flex items-center space-x-2">
				<a href="logout.php">
					<i class='bx bx-log-out-circle icon'></i>
					<span class="tituloBtn">Cerrar Sesión</span>
				</a>
			</button>
		</div>
	</div>

	<!-- Barra de navegación -->
	<div class="navbar-menu relative z-50 hidden hide-navbar">
		<!-- Contenido de la barra de navegación -->
	</div>

</body>

</html>