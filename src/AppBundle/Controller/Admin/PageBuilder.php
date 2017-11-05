<?php

namespace AppBundle\Controller\Admin;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class PageBuilder extends AdminController
{
	protected $rows = [];
	
	protected $cols = [];
	
	public function startRow(){
		
		$this->rows[] = '<div class="row">';
		
		return $this;
		
	}
	
	public function endRow(){
		
		$this->rows[] = '</div>';
		
		return $this;
	}
	
	public function startCol(string $colClass) {
		
		$this->cols[] = '<div class="'.$colClass.'">';
		
		return $this;
		}
	
	public function endCol() {
		
		$this->cols[] = '</div>';
		
		if (!empty($this->rows)){
			
			$this->rows[] = $this->cols;
		}
		
		return $this;
		
	}
	
	public function build() {
		
		return $this->rows;
		
		}
}
