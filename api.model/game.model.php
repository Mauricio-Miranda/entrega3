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

    /* Obtener todos los juegos de la DB
    //function getAllGames(){        
       
        $query = $this->db -> prepare ('SELECT juegos.*, desarrolladores.company AS company FROM juegos
        INNER JOIN desarrolladores ON juegos.desarrollador = desarrolladores.id_desarrollador
        WHERE');
        $query-> execute();           
        $games = $query -> fetchAll(PDO::FETCH_OBJ);                       

        return $games;  */

    function getAllGames($orderBy, $direction, $filterBy, $offset, $limit) {
        $query = $this->db->prepare(" SELECT juegos.*, desarrolladores.company AS company FROM juegos
                                      INNER JOIN desarrolladores ON juegos.desarrollador = desarrolladores.id_desarrollador
                                      WHERE (? IS NULL OR desarrolladores.company = ?)
                                      ORDER BY $orderBy $direction LIMIT ?, ?");

        $query->execute([$filterBy, $filterBy, $offset, $limit]);
        $games = $query->fetchAll(PDO::FETCH_OBJ);   
        return $games;
    }




    function getGame($id){
        $query = $this->db->prepare('SELECT * FROM juegos WHERE id = ?');
        $query->execute([$id]);
        $game = $query -> fetch(PDO::FETCH_OBJ);
        return $game;
    }

    public function addGame($nombre, $texto, $imagen, $desarrollador){ 
        $query = $this->db -> prepare ('INSERT INTO juegos (juego, texto, imagen, desarrollador) VALUE (?, ?, ?, ?)');  
        $query->execute([$nombre, $texto, $imagen, $desarrollador]);           
    
    }

    function updateGame($id, $juego, $texto, $imagen, $desarrollador){
        $query = $this->db -> prepare('UPDATE juegos SET juego =?, texto=?, imagen=?, desarrollador=? WHERE id = ?');
        $query-> execute([$juego, $texto, $imagen, $desarrollador, $id]);
        
    }
}