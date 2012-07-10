<?php

class TestCase extends Silex\WebTestCase {

	/**
	 * Setup the test environment.
	 *
	 * @return void
	 */
	public function setUp()
	{
		parent::setUp();

		$this->client = $this->createClient();
	}

	/**
	 * Execute a request against the test client application.
	 *
	 * @return Symfony\Component\DomCrawler\Crawler
	 */
	public function request()
	{
		$callable = array($this->client, 'request');

		return call_user_func_array($callable, func_get_args());
	}

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