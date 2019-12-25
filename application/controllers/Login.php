<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->model('mdlloginuser');
    }

    public function index() {
        $this->load->view('auth/login');
    }

    public function auth()
    {
        $username = $this->input->post('username');
        $password = $this->input->post('password');
        $pass = md5($password);

        $cek_user = $this->mdlloginuser->authUser($username, $pass);

        if($cek_user->num_rows() >= 1) 
        {
            foreach($cek_user->result() as $data) {
                $sess_data['hak_akses'] = $data->hak_akses;
                // var_dump($data->username);
                $dataId = $data->id;
                $dataUser = $data->username;
                $dataEmail = $data->email;

                $this->session->set_userdata($sess_data);
                $this->session->set_userdata('username', $dataUser);
                $this->session->set_userdata('id', $dataId);
                $this->session->set_userdata('email', $dataEmail);

                if($this->session->userdata('hak_akses') == 'user') {
                    $this->session->set_flashdata('message_success', 'Success Login');
                    redirect(base_url('/'));                
                } else {
                    $this->session->set_flashdata('message_err', 'Username and password not found');
                    return redirect($this->agent->referrer());
                }
            }
        }
        else 
        {
            $this->session->set_flashdata('message_err', 'Wrong username and password');
            redirect($this->agent->referrer());
        }
    }

    public function logout() {
        if($this->session->userdata('hak_akses') == 'user') {
            $this->session->sess_destroy();
        }

        redirect($this->agent->referrer());
    }
}

?>