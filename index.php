<?php
session_start();

$action = $_GET['action'] ?? '';
$state = $_GET['state'] ?? '';

// Importar el controlador necesario
require_once 'app/Controllers/LoginController.php';

// Crear una instancia del controlador de inicio de sesión
$controller = new LoginController();

// Realizar una selección basada en el valor de "action"
switch ($action) {
        // Si el valor de "action" es "login"
    case 'login':
        // Procesar el inicio de sesión
        $controller->procesarLogin();
        break;
        // Si el valor de "action" es cualquier otro o está vacío
    default:
        // Mostrar el formulario de inicio de sesión
        $controller->mostrarFormLogin();
        break;
}