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
            $this->view->response(["message" => "No hay juegos disponibles en la página solicitada"], 404);
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
        //$this->data = file_get_contents("php://input");
        $game = $this->getData();

        if($game){
            $this->model->addGame($game->juego, $game->texto,$game->imagen,$game->desarrollador);
            $this->view->response("Game successfully added.",200);
        }
        else{
            $this->view->response("Game not added, an error has occurred.",404);
        }

    }

    public function updateGame($params = null) {
        //$this->data = file_get_contents("php://input");
        
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
}