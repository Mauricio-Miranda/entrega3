<?php
require_once 'api.model/game.model.php';
require_once 'api.view/api.view.php';

class GameController {
    private $model;
    private $view;
    private $data;

    function __construct() {
        $this->model = new GamesModel();
        $this->view = new ApiView();
    }

    public function getAll($params = null) {

        // Parametro de ordenamiento - campo por defecto 'id' - se puede ordenar por 'id', 'juego' o 'desarrollador'
        // $orderBy solo puede tener 3 unicos valores por lo que no hay peligro de inyeccion en SQL
       
        if (isset ($_GET['order'])){
            $orderBy = $_GET['order'];
            if($orderBy !=='id' && $orderBy !=='juego' && $orderBy !== 'desarrollador'){
                $orderBy = 'id';            
            }
        }else{
            $orderBy = 'id';
        }

        // Direccion del ordenamiento - Direccion por defecto 'ascendente' - puede ser ascendente o descendente
        // $direction solo puede tener 2 unicos valorespor lo que no hay peligro de inyeccion en SQL
        
        if (isset($_GET['dir'])){
            $direction = $_GET['dir'];
            if($direction !=='asc' && $direction !== 'desc'){
                $direction = 'asc';
            }
        }else{
            $direction = "asc";
        }

        // Parametro de filtro - por defecto 'null' sin filtro - puede filtrarse por 'desarrollador'

        if (isset($_GET['filterBy'])){
            //Aca tengo que controlar que lo que trae $_GET['filterBy']  sea el nombre correcto de una de
            // las companias cargadas en la base de datos para asignarla, de lo contrario se asigna NULL
            $filterBy = $_GET['filterBy'];
            if (!$this->isValidCompany($filterBy)){
                // Si el nombre de la compania es incorrecto devuelve mensaje y codigo de error
                $this->view->response(array("error" => "Nombre de compania invalido"), 400);
                exit;
            }            
        }else{
            $filterBy = null;
        }
       
        // Paginacion

        if (isset($_GET['page']) && is_numeric($_GET['page']) && $_GET['page'] > 0){
            $page = $_GET['page'];
        } else{        
            $page = 1;
        }     

        if (isset($_GET['limit']) && is_numeric($_GET['limit']) && $_GET['limit'] > 0){
            $limit = $_GET['limit'];
        } else{        
            $limit = 5;
        }
                
        $offset = ($page - 1) * $limit;
       
        $games = $this->model->getAllGames($orderBy, $direction, $filterBy, $offset, $limit);
        
        if (empty($games)) {
            $this->view->response(["message" => "No hay juegos disponibles en la página solicitada"], 200);
        } else {
            // Si hay juegos, responder normalmente
            $this->view->response($games);
        }       
    }

    private function isValidCompany($company){
        $cantCompany = $this->model->getCantCompany($company);
        return $cantCompany > 0;

    }

    public function getOne($params = null){
        $id = $params[":ID"];
        $game = $this->model->getGame($id);

        if ($game)
            $this->view->response($game);
        else
        $this->view->response("game id=$id not found", 404);
    }

    public function addGame(){
       
        $game = $this->getData();
        $numCompany = 0; 
        if($game){
            switch ($game->desarrollador){
                case "capcom": $numCompany = 1;
                break;
                case "konami": $numCompany = 2;
                break;
                case "bandai": $numCompany = 3;
                break;
                case "riot": $numCompany = 4;
                break;
                case "naughtydog": $numCompany = 5;
                break;
                default: $numCompany = 0;
                break;
            }

            if ($numCompany != 0){
                $this->model->addGame($game->juego, $game->texto,$game->imagen,$numCompany);
                $this->view->response("Game successfully added.",200);
            }
            else{
                $this->view->response("Game not added. The specified company does not exist.",404);
            }
        
        }
    }

    public function updateGame($params = null) {
        
        
        $id = $params[':ID'];
        $data = $this->getData();
        
        $game = $this->model->getGame($id);
        if ($game) {
            $this->model->updateGame($id, $data->juego, $data->texto,$data->imagen,$data->desarrollador);
            $this->view->response("El juego fue modificado con exito.", 200);
        } else
            $this->view->response("El juego con el id={$id} no existe", 404);
    }

    private function getData(){
        $this->data = file_get_contents("php://input");
        return json_decode($this->data);
    }

    public function remove($params = null){
        $id = $params[":ID"];
        $msg = $this->model->delGame($id);  
        if($msg == "ok"){
            $this->view->response("Game deleted successfully",200);
        }
        else{
            $this->view->response("Failed to delete the game",404);
        }
    }
}