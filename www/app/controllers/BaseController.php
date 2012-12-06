<?php

class BaseController extends Controller {

	/**
	 * The layout that should be used for responses.
	 *
	 * @var string
	 */
	protected $layout;

	/**
	 * Call the requested controller action.
	 *
	 * @param  string  $method
	 * @param  array   $parameters
	 * @return mixed
	 */
	protected function directCallAction($method, $parameters)
	{
		$this->setupLayout();

		$response = parent::directCallAction($method, $parameters);

		// If no response was returned from the controller action and a layout is
		// being used we will assume we want to just return the layout view as
		// any sub-views were probably bound on this during the action call.
		if (is_null($response) and ! is_null($this->layout))
		{
			return $this->layout;
		}

		return $response;
	}

	/**
	 * Setup the layout view if necessary.
	 *
	 * @return void
	 */
	protected function setupLayout()
	{
		if ( ! is_null($this->layout))
		{
			$this->layout = View::make($this->layout);
		}
	}

}