<?php

namespace AppBundle\Widget;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

abstract class AbstractWidget extends Controller {
	
	protected function em() {
	
		return $this->getDoctrine()->getManager();
	
	}

}
