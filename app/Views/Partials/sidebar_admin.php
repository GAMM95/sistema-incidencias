<!DOCTYPE html>
<html lang="es">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- Implementación de funcionalidades para la vista cliente -->
	<script src="app/Views/Func/navbar.js"></script>

	<!-- Importacion de iconos -->
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
	<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
	<title>Gestión de Incidencias - Admin</title>

</head>

<body>
	<!-- Contenedor de la barra lateral -->
	<div class="sideBar hidden lg:block">
		<!-- División para el logo -->
		<div class="logoDiv flex">
			<img src="public/assets/image.png" alt="Imagen logo MDE" class="img_logo">
		</div>

		<!-- División del menú -->
		<div class="menuDiv">
			<h3 class="divTitulo"></h3>
			<ul class="menuList grid">
				<!-- Item registrar incidencia -->
				<li class="listItem">
					<a href="registrar_incidencia.php" class="menuLink flex">
						<i class='bx bxs-id-card icon'></i>
						<span class="smallText">Registrar Incidencia</span>
					</a>
				</li>
				<!-- Item Consultar incidencia -->
				<li class="listItem">
					<a href="consultar_incidencia.php" class="menuLink flex">
						<i class='bx bxs-notepad icon'></i>
						<span class="smallText">Consultar Incidencia</span>
					</a>
				</li>
				<!-- Item Cerrar incidencia (Solo visible para administradores) -->
				<?php
				if ($esAdministrador) {
					echo '<li class="listItem">
                            <a href="cerrar_incidencia.php" class="menuLink flex">
                                <i class="bx bxs-car icon"></i>
                                <span class="smallText">Cerrar Incidencia</span>
                            </a>
                        </li>';
				}
				?>
				<!-- Item Registrar persona (Solo visible para administradores) -->
				<?php
				if ($esAdministrador) {
					echo '<li class="listItem">
                            <a href="registrar_usuario.php" class="menuLink flex">
                                <i class="bx bxs-home icon"></i>
                                <span class="smallText">Registrar usuario</span>
                            </a>
                        </li>';
				}
				?>
				<!-- Item Consultar usuario (Solo visible para administradores) -->
				<?php
				if ($esAdministrador) {
					echo '<li class="listItem">
                            <a href="consultar_usuario.php" class="menuLink flex">
                                <i class="bx bxs-home icon"></i>
                                <span class="smallText">Consultar usuario</span>
                            </a>
                        </li>';
				}
				?>
			</ul>
		</div>

		<!-- División del menú (cerrar sesión) -->
		<div class="menuDiv">
			<ul class="menuList grid">
				<div class="mt-auto">
					<button class="btn !shadow-2xl logout flex">
						<a href="logout.php">
							<i class='bx bx-log-out-circle icon'></i>
							<span class="tituloBtn">Cerrar Sesión</span>
						</a>
					</button>
				</div>
			</ul>
		</div>
	</div>

	<!-- Barra de navegación -->
	<div class="navbar-menu relative z-50 hidden hide-navbar">
		<!-- Contenido de la barra de navegación -->
	</div>
</body>

</html>