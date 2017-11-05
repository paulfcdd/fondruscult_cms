<?php
namespace AppBundle\Entity;

use AppBundle\Entity\Traits\DateTrait;
use AppBundle\Entity\Traits\FileTrait;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Table(name="post")
 * @ORM\HasLifecycleCallbacks()
 * @ORM\Entity()
 */
class Post extends EntitySuperclass {
	
	use FileTrait,
        DateTrait;
        
    /**
     * @var string $slug
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
     * @ORM\ManyToOne(targetEntity="Category", inversedBy="posts")
     * @ORM\JoinColumn(name="category_id", referencedColumnName="id")
     */
    private $category;
    
    /**
     * @return string
     */
    public function getSlug()
    {
        return $this->slug;
    }

    /**
     * @param string $slug
     * @return Page
     */
    public function setSlug(string $slug)
    {
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
    
    public function setCategory(Category $category) {
		$this->category = $category;
		
		return $this;
		}
	
	public function getCategory() {
		return $this->category;
		}
}
