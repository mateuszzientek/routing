<?php

namespace app\controllers;

use app\forms\CalcForm;
use app\transfer\CalcResult;

class CalcCtrl {

  
	private $form;   
	private $result; 
	private $hide_intro; 


	public function __construct(){
		$this->form = new CalcForm();
		$this->result = new CalcResult();
		$this->hide_intro = true;
	}
	
	public function getParams(){
		$this->form->kwota = getFromRequest('kwota');
		$this->form->lata = getFromRequest('lata');
		$this->form->opr = getFromRequest('opr');
	}
	
	public function validate() {
		if (! (isset ( $this->form->kwota ) && isset ( $this->form->lata ) && isset ( $this->form->opr ))) {
			return false;
		} else { 
			$this->hide_intro = false; 
		}
		
		if ($this->form->kwota == "") {
			getMessages()->addError('Nie podano kwoty');
		}
		if ($this->form->lata == "") {
			getMessages()->addError('Nie podano lat');
		}
		if ($this->form->opr == "") {
			getMessages()->addError('Nie podano oprocentowania');
		}
	
		if (! getMessages()->isError()) {
			
			
			if (! is_numeric ( $this->form->kwota )) {
				getMessages()->addError('Kwota nie jest liczbą całkowitą');
			}
			
			if (! is_numeric ( $this->form->lata )) {
				getMessages()->addError('Lata nie są liczbą całkowitą');
			}

			if (! is_numeric ( $this->form->opr )) {
				getMessages()->addError('Oprocentowanie nie jest liczbą całkowitą');
			}
		}
		
		return ! getMessages()->isError();
	}
	
	
	public function action_calcCompute() {

		$this->getParams();
		
		if ($this->validate()) {
				
			if($this->form->kwota>0 && $this->form->lata>0 && $this->form->opr>0)
	        {
			$this->form->kwota = intval($this->form->kwota);
			$this->form->lata = intval($this->form->lata);
			$this->form->opr = intval($this->form->opr);

			getMessages()->addInfo('Parametry poprawne.');
				
			$procenty= $this->form->kwota*($this->form->opr/100);
	        $this->result->result= ($this->form->kwota/($this->form->lata*12))+$procenty;
			
			getMessages()->addInfo('Wykonano obliczenia.');
			}else getMessages()->addError('Podano wartosci ujemne.');
		}
		
		$this->generateView();
	}

	public function generateView(){
	
		getSmarty()->assign('user',unserialize($_SESSION['user']));
		
		getSmarty()->assign('page_title','Kalkulator kredytowy');
				
		getSmarty()->assign('form',$this->form);
		getSmarty()->assign('result',$this->result);
		getSmarty()->assign('hide_intro',$this->hide_intro);
		
		getSmarty()->display('calc.tpl');
	}
}
