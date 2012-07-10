<?php

class ExampleTest extends TestCase {

	/**
	 * A basic functional test example.
	 *
	 * @return void
	 */
	public function testBasicExample()
	{
		$crawler = $this->request('GET', '/');

		$this->assertCount(1, $crawler->filter('h1:contains("Hello World!")'));
	}

}