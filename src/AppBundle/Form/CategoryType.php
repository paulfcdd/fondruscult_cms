<?php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\Extension\Core\Type as CoreType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use AppBundle\Entity\Category;


class CategoryType extends AbstractType {
	public function buildForm(FormBuilderInterface $builder, array $options) {
		$builder
		->add('name', CoreType\TextType::class,[
		'label' => 'Category name'
		])
		 ->add('parent', EntityType::class, [
				'class' => Category::class,
				'choice_label' => 'name',
				'placeholder' => 'Select parent',
				'required' => false,

            ]);
	}
	
    public function configureOptions(OptionsResolver $resolver) {
		$resolver->setDefaults([
		'data_class' => Category::class,
		]);
	}
}
