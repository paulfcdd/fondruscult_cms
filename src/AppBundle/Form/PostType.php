<?php

namespace AppBundle\Form;

use AppBundle\Form\Type\BaseFormType;
use Symfony\Component\OptionsResolver\OptionsResolver;
use AppBundle\Entity\Post;
use AppBundle\Entity\Category;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\Extension\Core\Type as CoreType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use AppBundle\Form\Type\FileUploadType;

class PostType extends BaseFormType {
	public function buildForm(FormBuilderInterface $builder, array $options)
    {
        parent::buildForm($builder, $options);

        $builder
            ->add('slug', CoreType\TextType::class, [
                'label' => 'admin.form.page.slug',
                'required' => false,
            ])
            ->add('seoKeywords', CoreType\TextType::class, [
				'required' => false,
            ])
            ->add('category', EntityType::class, [
				'class' => Category::class,
				'choice_label' => 'name',
				'placeholder' => 'Select parent',
				'required' => false,

            ])
            ->add('seoDescription', CoreType\TextareaType::class, [
            'required' => false,
            'attr' => [
				'class' => 'form-control',
				'cols' => 5,
				'rows' => 5
				]
            ])
            ->add('files', FileUploadType::class);;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Post::class,
            'parentTitleLabel' => 'admin.form.page.title',
            'parentContentLabel' => 'admin.form.page.content',
            'allow_extra_fileds' => true,
            ]);
    }
}
