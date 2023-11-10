<?php
require_once 'app/Models/Incidencias.php';

class IncidenciaController
{
  private $incidenciasModel;
  public function __construct($incidenciasModel){
    $this->incidenciasModel = $incidenciasModel;
  }

}