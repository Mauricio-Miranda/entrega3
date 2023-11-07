<?php

class GamesModel{

    private $db;

    function __construct(){
        // 1.- Abro una coneccion 
        $this->db = $this-> conect();
        
    }


    // Abre la coneccion con la base de Datos
    function conect(){
        $db = new PDO ('mysql:host=localhost;' . 'dbname=tpeweb2; charset=utf8', 'root', '');
        return $db;
    }

    // Obtener todos los juegos de la DB
    function getAllGames(){
        
        // 2.- Enviamos una consulta y nos devuelve el resultado.-
        // SELECT * FROM juegos
       // $query = $this->db -> prepare ('SELECT * FROM juegos');  // Son dos sub pasos a) Preparar la consulta y
        $query = $this->db -> prepare ('SELECT juegos.*, desarrolladores.company AS company FROM juegos
        INNER JOIN desarrolladores ON juegos.desarrollador = desarrolladores.id_desarrollador');
        $query-> execute();                                      // b) Ejecutarla
        /*
        SELECT juegos.*, desarrolladores.company AS company FROM juegos
        INNER JOIN desarrolladores ON juegos.desarrollador = desarrolladores.id_desarrollador




        'SELECT juegos.*, desarrolladores.* FROM juegos AS juegos INNER JOIN desarrolladores AS desarrolladores ON juegos.desarrollador = desarrolladores.id_desarrollador');
        */ 

        // 3.- Obtengo la repuesta de la DB
        $games = $query -> fetchAll(PDO::FETCH_OBJ);            // Obtengo un arreglo con TODOS los juegos        

        // 4.- Cerramos la coneccion.-   En PDO  NO HAY QUE CERRAR LA CONEXION

        return $games;  // devuelvo los juegos

    }
}