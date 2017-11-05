<?php

namespace AppBundle\Entity;


use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity()
 * @ORM\Table(name="widget")
 */ 
class Widget {
	
	
	/**
     * @var integer
     *
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
	private $id;
	
	/**
     * @var string
     * @ORM\Column()
     */
	protected $name;
	
	/**
     * @var string
     * @ORM\Column(type="text", length=1000)
     */
	protected $description;
	
	/**
     * @var string
     * @ORM\Column()
     */
	protected $author;
	
	/**
     * @var string
     * @ORM\Column()
     */
	protected $version;
	
	/**
     * @var boolean
     * @ORM\Column(type="boolean")
     */
	protected $enabled;
	
}
