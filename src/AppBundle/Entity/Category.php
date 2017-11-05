<?php

namespace AppBundle\Entity;

use AppBundle\Entity\Traits\DateTrait;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * @ORM\Entity()
 * @ORM\HasLifecycleCallbacks()
 * @ORM\Table(name="post_category")
 */
class Category {
	
	use DateTrait;
	
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
	private $name;
	
	/** 
     * @ORM\OneToOne(targetEntity="Category")
     * @ORM\JoinColumn(name="parent_id", referencedColumnName="id")
     */ 
	private $parent;
	
	/**
     * @var bool $removed
     * @ORM\Column(type="boolean")
     */
    private $removed = 0;
    
    /**
     * @ORM\OneToMany(targetEntity="Post", mappedBy="category")
     */ 
    private $posts;
    
    /**
     * @ORM\ManyToOne(targetEntity="User")
     * @ORM\JoinColumn(name="author_id", referencedColumnName="id")
     */
    private $author;
    
    public function __construct() {
		$this->posts = new ArrayCollection();
	}
    
	public function getId() {
		
		return $this->id;	
	}
	
	public function setName($name) {
		$this->name=$name;
		return $this;	
	}
	
	public function getName() {
		return $this->name;
	}
	
	 public function setParent($parent) {
		$this->parent =$parent;
		return $this;
	}
	
	public function getParent() {
		return $this->parent;
	}
	
	/**
     * @return bool
     */
    public function isRemoved()
    {
        return $this->removed;
    }

    /**
     * @param bool $removed
     * @return $this
     */
    public function setRemoved(bool $removed)
    {
        $this->removed = $removed;

        return $this;
    }
    
    public function addPost(Post $post) {
		if (!$this->posts->contains($post)){
			$this->posts->add($post);
		}	
		
		return $this;
	}
	
	public function removePost(Post $post) {
		$this->posts->removeElement($post);
		
		return $this;
	}
	
	public function getPosts() {
		return $this-posts;
	}
	
    /**
     * @return mixed
     */
    public function getAuthor()
    {
        return $this->author;
    }

    /**
     * @param mixed $author
     */
    public function setAuthor($author)
    {
        $this->author = $author;
    }
}
