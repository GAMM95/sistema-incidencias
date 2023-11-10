<?php
require_once 'config/SQL/conexion.php';

class Usuario
{
  private $conector;
  protected $username;
  protected $password;

  public function __construct($username, $password)
  {
    $this->conector = (new Conexion())->getConexion(); // Obtén la conexión a la base de datos directamente
    $this->username = $username;
    $this->password = $password;
  }

  public function iniciarSesion()
  {
    $query = "EXEC SP_Usuario_login :username, :password";
    $stmt = $this->conector->prepare($query);
    $stmt->bindParam(':username', $this->username);
    $stmt->bindParam(':password', $this->password);
    $stmt->execute();

    $resultado = $stmt->fetch();

    if ($resultado) {
      // Inicio de sesión exitoso, almacena el nombre de la persona en la sesión
      $_SESSION['nombreDePersona'] = $resultado['PER_nombre'];
      return true;
    }

    return false;
  }

  public function obtenerRol()
  {
    $consulta = " SELECT  ROL_nombre as rol
                    FROM USUARIO u
                    INNER JOIN ROL r ON r.ROL_codigo = u.ROL_codigo 
                    WHERE USU_usuario = :username";
    $stmt = $this->conector->prepare($consulta);
    $stmt->bindParam(':username',  $this->username);
    $stmt->execute();

    $fila = $stmt->fetch();

    if ($fila) {
      return $fila['rol']; // Devuelve el rol del usuario
    } else {
      return null; // El usuario no existe o no tiene un rol asignado
    }
  }
}
