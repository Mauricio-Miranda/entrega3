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

        if (isset ($_GET['order'])){
            $orderBy = $_GET['order'];
            if($orderBy !=='id' && $orderBy !=='juego' && $orderBy !== 'desarrollador'){
                $orderBy = 'id';
            }
        }

        // Direccion del ordenamiento - Direccion por defecto 'ascendente' - puede ser ascendente o descendente

        if (isset($_GET['dir'])){
            $direction = $_GET['dir'];
            if($direction !=='asc' && $direction !== 'des'){
                $direction = 'asc';
            }
        }

        // Parametro de filtro - por defecto 'null' sin finltro - puede filtrarce por 'desarrollador'

        if (isset($_GET['filterBy'])){
            $filterBy = $_GET['filterBy'];
            if ($filterBy !== 'desarrollador'){
                $filterBy = null;
            }
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
            $limit = 10;
        }

        if (isset($_GET['paginate']) && $_GET['paginate'] === 'true') {
            // Calcular el offset para la paginación
            $offset = ($page - 1) * $limit;
            $games = $this->model->getAllGames($orderBy, $direction, $filterBy, $offset, $limit);
        } else {
            // Sin paginación, obtener todos los juegos
            $games = $this->model->getAllGames($orderBy, $direction, $filterBy, null, null);
        }


        //$games = $this->model->getAllGames();
        $this->view->response($games);
        
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