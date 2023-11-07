<?php
// Incluye el archivo que define la clase Usuario
require_once 'app/Models/Usuario.php';

class LoginController
{
	public function mostrarFormLogin()
	{
		// Incluye la vista del formulario de inicio de sesión
		require_once 'app/Views/Frmlogin.php';
	}

	public function procesarLogin()
	{
		// Verifica si la solicitud es POST (es decir, se envió el formulario)
		if ($_SERVER['REQUEST_METHOD'] === 'POST') {
			// Obtén los valores de usuario y contraseña del formulario
			$username = $_POST['username'];
			$password = $_POST['password'];

			// Crea una instancia de la clase Usuario con los valores proporcionados
			$usuario = new Usuario($username, $password);

			// Intenta iniciar sesión con los datos proporcionados
			if ($usuario->iniciarSesion()) {
				// Si el inicio de sesión es exitoso, inicia la sesión y redirige al menú
				session_start();
				$_SESSION['username'] = $username;
				header("Location: inicio.php");
				exit();
			} else {
				// Si el inicio de sesión falla, muestra un mensaje de error
				echo "Verifica tus credenciales.";
				// $_SESSION['login_message'] = 'Inicio de sesión fallido. Verifica tus credenciales.';
				header("Location: index.php?state=failed");
			}
		}
	}
}