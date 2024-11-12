<?php

namespace App\DataFixtures;

use App\Entity\Client;
use Doctrine\Persistence\ObjectManager;
use Doctrine\Bundle\FixturesBundle\Fixture;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        $cli = new Client();
        $cli->setNom("test");
        $cli->setPrenom("test");
        $manager->persist($cli);

        $manager->flush();
    }
}
