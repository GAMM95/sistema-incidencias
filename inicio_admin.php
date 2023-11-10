<?php
// Iniciar la sesión para mantener el estado del usuario
session_start();

// Verificar si el usuario no ha iniciado sesión
if (!isset($_SESSION['username'])) {
    // Redirigir al usuario a la página de inicio de sesión si no hay una sesión iniciada
    header("Location: index.php");
    exit(); // Terminar el script para evitar que se siga ejecutando
}

require_once 'config/SQL/conexion.php';

$conexion = new Conexion();
$conector = $conexion->getConexion();
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="public/assets/logo.ico" />
    <title>Gestion de incidencias - Admin</title>
</head>
<body>
    <!-- Contenedor principal -->
    <div class="container">
        <?php include("app/Views/Partials/sidebar_admin.php"); ?>
        <?php include("app/Views/PnlInicio.php"); ?>
    </div>
</body>
</html>