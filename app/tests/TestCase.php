<?php

class TestCase extends Silex\WebTestCase {

    /**
     * Creates the application.
     *
     * @return Symfony\Component\HttpKernel\HttpKernel
     */
    public function createApplication()
    {
    	return require __DIR__.'/../../shine.php';
    }

}