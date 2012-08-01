<?php

class TestCase extends Illuminate\Foundation\TestCase {

    /**
     * Creates the application.
     *
     * @return Symfony\Component\HttpKernel\HttpKernelInterface
     */
    public function createApplication()
    {
    	return require __DIR__.'/../../shine.php';
    }

}