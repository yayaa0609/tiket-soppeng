<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->model('mdlfetch');
    }

    public function index()
    {
        $this->mdlfetch->deleteTransPesawat();
        $data['allAsal'] = $this->mdlfetch->getDataPAsal();
        $data['allTujuan'] = $this->mdlfetch->getDataPTujuan();
        $this->load->view('home', $data);
    }
}
