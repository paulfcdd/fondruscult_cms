<?php

namespace AppBundle\Entity;


use AppBundle\Entity\Traits\DateTrait;
use AppBundle\Entity\Traits\FileTrait;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Table(name="page")
 * @ORM\HasLifecycleCallbacks()
 * @ORM\Entity()
 */
class Page extends EntitySuperclass
{
    use FileTrait,
        DateTrait;
        
    const PAGE_TYPE = [
		'Simple page' => 'simple_page',
		'Page with posts' => 'page_with_post'
    ];
        
    /**
     * @var string | null $slug
     * @ORM\Column(nullable=true)
     */
    private $slug;
    
    /**
     * @var string
     * @ORM\Column(nullable=true)
     */
    private $seoKeywords;

    /**
     * @var string
     * @ORM\Column(type="text", nullable=true)
     */
    private $seoDescription;

    /**
     * @var boolean
     * @ORM\Column(type="boolean")
     */
    private $inNavbar = false;

    /**
    * @var boolean
    *@ORM\Column(type="boolean")
    */
    private $mainPage = false;
    
    /** 
     * @ORM\OneToOne(targetEntity="Page")
     * @ORM\JoinColumn(name="parent_id", referencedColumnName="id")
     */ 
    private $parent = null;
    
    /**
     * @var string
     * @ORM\Column(nullable=true)
     */ 
    private $type;
    
    /**
     * @var integer
     * @ORM\Column(type="integer", length=10, nullable=true)
     */ 
    private $postCategory;
    
	 /**
     * @var integer
     * @ORM\Column(type="integer", length=5, nullable=true)
     */ 
    private $postPerPage;
    
    /**
     * @return string
     */
    public function getSlug()
    {
        return $this->slug;
    }

    /**
     * @param string | null $slug
     * @return Page
     */
    public function setSlug(string $slug = null)
    {
		if (!$slug) {
			$slug = '/';
		}
		
        $this->slug = $slug;
        return $this;
    }

    /**
     * @return string
     */
    public function getSeoKeywords()
    {
        return $this->seoKeywords;
    }

    /**
     * @param string $seoKeywords
     * @return Page
     */
    public function setSeoKeywords(string $seoKeywords)
    {
        $this->seoKeywords = $seoKeywords;
        return $this;
    }

    /**
     * @return string
     */
    public function getSeoDescription()
    {
        return $this->seoDescription;
    }

    /**
     * @param string $seoDescription
     * @return Page
     */
    public function setSeoDescription(string $seoDescription)
    {
        $this->seoDescription = $seoDescription;
        
        return $this;
    }

    /**
     * @return bool
     */
    public function isInNavbar()
    {
        return $this->inNavbar;
    }

    /**
     * @param bool $inNavbar
     * @return Page
     */
    public function setInNavbar(bool $inNavbar)
    {
        $this->inNavbar = $inNavbar;
        
        return $this;
    }
	
	/**
	 * @return bool 
	 */
    public function isMainPage() {
      return $this->mainPage;
    }
    
    /**
     * @param bool $mainPage
     * @return Page
     */ 
    public function setMainPage(bool $mainPage) {
      $this->mainPage = $mainPage;

      return $this;
    }
    
    
    public function setParent($parent) {
		$this->parent =$parent;
		return $this;
	}
	
	public function getParent() {
		return $this->parent;
	}
	
	/**
	 * @param string
	 * @return Page
	 */ 
	public function setType(string $type) {
		
		$this->type = $type;
		
		return $this;
		
	}
	
	/**
	 * @return string
	 */ 
	public function getType() {
		
		return $this->type;
		
	}
	
	/**
	 * @return Page
	 */ 
	public function setPostCategory($postCategory) {
		
		$this->postCategory = $postCategory;
		
		return $this;
		
	}
	
	public function getPostCategory() {
			
		return $this->postCategory;
		
	}
	/**
	 * @return Page
	 */ 
	public function setPostPerPage($postPerPage) {
		
		$this->postPerPage = $postPerPage;
		
		return $this;
		
	}
	
	public function getPostPerPage() {
			
		return $this->postPerPage;
		
	}
}
