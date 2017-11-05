<?php

namespace AppBundle\Form;

use AppBundle\Form\Type\BaseFormType;
use Symfony\Component\OptionsResolver\OptionsResolver;
use AppBundle\Entity\Page;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\Extension\Core\Type as CoreType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;

class PageType extends BaseFormType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        parent::buildForm($builder, $options);

        $builder
			->add('mainPage', CoreType\CheckboxType::class, [
				'label' => 'admin.form.page.main_page',
				'required' => false,

 			])
 			->add('inNavbar', CoreType\CheckboxType::class, [
				'label' => 'admin.form.page.in_navbar',
				'required' => false,
 			])
            ->add('slug', CoreType\TextType::class, [
                'label' => 'admin.form.page.slug',
                'required' => false,
            ])
            ->add('seoKeywords', CoreType\TextType::class, [
				'required' => false,
            ])
            ->add('parent', EntityType::class, [
				'class' => Page::class,
				'choice_label' => 'title',
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
            ->add('type', CoreType\ChoiceType::class, [
				'label' => 'Select page type',
				'choices' => Page::PAGE_TYPE,
				'required' => false,
				'placeholder'=>false,
            ]);
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Page::class,
            'parentTitleLabel' => 'admin.form.page.title',
            'parentContentLabel' => 'admin.form.page.content',
            'allow_extra_fields' => true,
            ]);
    }


}
