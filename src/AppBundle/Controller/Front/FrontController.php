<?php

namespace AppBundle\Controller\Front;


use AppBundle\Entity\Category;
use AppBundle\Entity\Page;
use AppBundle\Entity\Post;
use AppBundle\Service\Utilities;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Routing\Annotation\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Symfony\Component\HttpFoundation as Http;
use AppBundle\Service\FileUploaderService;

class FrontController extends Controller
{
	protected $posts = null;
	
	public function em() {
		return $this->getDoctrine()->getManager();
	}
	
    /**
     * @param string | null $slug
     * @return Http\Response
     * @Route("/{slug}",
     *     name="front.mainController"
     * )
     */
    public function indexAction(string $slug = null) {
				
		if (!$slug) {
			$slug = '/';
		}

		/** @var Page $page */
		$page = $this->em()->getRepository(Page::class)->findOneBy(['removed' => false, 'slug' => $slug]);

		if ($page->getType() == 'page_with_post') {

		    $categories = [];

		    $categories[] = $page->getPostCategory();

		    $relatedCategories = $this->em()
                ->getRepository(Category::class)
                ->findBy(['parent' => $page->getPostCategory()]);


		    if (!empty($relatedCategories)) {
		         /** @var Category $relatedCategory */
                foreach ($relatedCategories as $relatedCategory) {
		            $categories[] = $relatedCategory->getId();
                }
            }

			$criteria = [
                'removed' => false,
                'category' => $categories,
			];
			
			$orderBy = null;
			
			$limit = $page->getPostPerPage();
			
			$offset = null;
			
			$this->posts = $this->em()->getRepository(Post::class)->findBy($criteria, $orderBy, $limit, $offset);
		}
		
		return $this->render(':default/front/page:'.$page->getType().'.html.twig', [
		'page' => $page,
		'posts' => $this->posts,
		]);
    }

    /**
     * @Route("/{page_slug}?category={id}", name="filter_by_category")
     * @Method({"GET"})
     */
    public function filterByCategoryAction($page_slug, $id) {

        var_dump($id);
        var_dump($page_slug);
        die;

    }

    /**
     * @param string $page_slug
     * @param string $post_slug
     * @return Http\Response
     * @Route("/{page_slug}/{post_slug}",
     *     name="front.show_post"
     * )
     */
    public function showPostAction(string $page_slug, string $post_slug) {
		
		
		$post = $this->em()->getRepository(Post::class)->findOneBySlug($post_slug);
		$page = $this->em()->getRepository(Page::class)->findOneBySlug($page_slug);
		
		return $this->render(':default/front/page:single_post_page.html.twig', [
		    'post' => $post,
            'page' => $page,
		]);
		
	}

    public function navbarAction() {
		
		$pages = $this->em()->getRepository(Page::class)->findBy([
			'removed' => false,
			'inNavbar' => true,
		]);
		
		return $this->render(':default/front/parts:header.html.twig', [
		'pages' => $pages,
		]);
	}
	
	public function footerAction() {
		
		$pages = $this->em()->getRepository(Page::class)->findBy([
			'removed' => false,
			'inFooter' => true,
		]);
		
		return $this->render(':default/front/parts:footer.html.twig', [
		'pages' => $pages,
		]);
	}

	    /**
     * @param string $response
     * @return mixed|string
     */
    private function googleRecaptchaVerifyer(string $response) {

        $curl = curl_init();

        curl_setopt_array($curl, [
            CURLOPT_URL => $this->getParameter('recaptcha_verify_url'),
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "POST",
            CURLOPT_POSTFIELDS =>
                "-----011000010111000001101001\r\nContent-Disposition: form-data; name=\"secret\"\r\n\r\n".$this->getParameter('recaptcha_secret_key')."\r\n-----011000010111000001101001\r\nContent-Disposition: form-data; name=\"response\"\r\n\r\n".$response."\r\n-----011000010111000001101001--\r\n",
            CURLOPT_HTTPHEADER => array(
                "content-type: multipart/form-data; boundary=---011000010111000001101001"
            ),
        ]);

        $response = curl_exec($curl);
        $err = curl_error($curl);

        curl_close($curl);

        if ($err) {
            return "cURL Error #:" . $err;
        } else {
            return $response;
        }

    }
}
