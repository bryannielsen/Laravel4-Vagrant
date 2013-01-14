<?php

return array(

	/*
	|--------------------------------------------------------------------------
	| Validation Language Lines
	|--------------------------------------------------------------------------
	|
	| The following language lines contain the default error messages used by
	| the validator class. Some of these rules have multiple versions such
	| such as the size rules. Feel free to tweak each of these messages.
	|
	*/

	"accepted"        => "The :attribute must be accepted.",
	"active_url"      => "The :attribute is not a valid URL.",
	"after"           => "The :attribute must be a date after :date.",
	"alpha"           => "The :attribute may only contain letters.",
	"alpha_dash"      => "The :attribute may only contain letters, numbers, and dashes.",
	"alpha_num"       => "The :attribute may only contain letters and numbers.",
	"before"          => "The :attribute must be a date before :date.",
	"between"         => array(
		"numeric" => "The :attribute must be between :min - :max.",
		"file"    => "The :attribute must be between :min - :max kilobytes.",
		"string"  => "The :attribute must be between :min - :max characters.",
	),
	"confirmed"       => "The :attribute confirmation does not match.",
	"different"       => "The :attribute and :other must be different.",
	"digits"          => "The :attribute must be :digits digits.",
	"digits_between"  => "The :attribute must be between :min and :max digits.",
	"email"           => "The :attribute format is invalid.",
	"exists"          => "The selected :attribute is invalid.",
	"image"           => "The :attribute must be an image.",
	"in"              => "The selected :attribute is invalid.",
	"integer"         => "The :attribute must be an integer.",
	"ip"              => "The :attribute must be a valid IP address.",
	"match"           => "The :attribute format is invalid.",
	"max"             => array(
		"numeric"     => "The :attribute must be less than :max.",
		"file"        => "The :attribute must be less than :max kilobytes.",
		"string"      => "The :attribute must be less than :max characters.",
	),
	"mimes"           => "The :attribute must be a file of type: :values.",
	"min"             => array(
		"numeric"     => "The :attribute must be at least :min.",
		"file"        => "The :attribute must be at least :min kilobytes.",
		"string"      => "The :attribute must be at least :min characters.",
	),
	"notin"           => "The selected :attribute is invalid.",
	"numeric"         => "The :attribute must be a number.",
	"required"        => "The :attribute field is required.",
	"required_with"   => "The :attribute field is required when :values is present.",
	"same"            => "The :attribute and :other must match.",
	"size"            => array(
		"numeric"    => "The :attribute must be :size.",
		"file"       => "The :attribute must be :size kilobytes.",
		"string"     => "The :attribute must be :size characters.",
	),
	"unique"          => "The :attribute has already been taken.",
	"url"             => "The :attribute format is invalid.",

	/*
	|--------------------------------------------------------------------------
	| Custom Validation Language Lines
	|--------------------------------------------------------------------------
	|
	| Here you may specify custom validation messages for attributes using the
	| convention "attribute.rule" to name the lines. This makes it quick to
	| specify a specific custom language line for a given attribute rule.
	|
	*/

	'custom' => array(),

	/*
	|--------------------------------------------------------------------------
	| Custom Validation Attributes
	|--------------------------------------------------------------------------
	|
	| The following language lines are used to swap attribute place-holders
	| with something more reader friendly such as E-Mail Address instead
	| of "email". This simply helps us make messages a little cleaner.
	|
	*/

	'attributes' => array(),

);