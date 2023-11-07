<?php
require_once 'api.model/game.model.php';
require_once 'api.view/api.view.php';

class ApiTaskController {
    private $model;
    private $view;
    private $data;

    function __construct() {
        $this->model = new GamesModel();
        $this->view = new ApiView();
    }

    public function getAll($params = null) {
        $games = $this->model->getAllGames();
        $this->view->response($games);
        
    }
}