#!/bin/bash
#Author : Raghupathi Kammari

<VirtualHost *:80>
	<Location /users>
	Redirect "/" "https://groups.google.com/a/vlabs.ac.in/forum/#!forum/"
	</Location>
	<Location /users/join>
	Redirect "/" "https://groups.google.com/a/vlabs.ac.in/forum/#!forum/"
	</Location>
	<Location /engineers>
	Redirect "/" "https://groups.google.com/a/vlabs.ac.in/forum/#!forum/"
	</Location>
	<Location /engineers/join>
	Redirect "/" "https://groups.google.com/a/vlabs.ac.in/forum/#!forum/"
	</Location>
	<Location /announce>
	Redirect "/" "https://groups.google.com/a/vlabs.ac.in/forum/#!forum/"
	</Location>
	Redirect "/" "https://groups.google.com/a/vlabs.ac.in/forum/#!forum/"
	<Location /announce/join>
	Redirect "/" "https://groups.google.com/a/vlabs.ac.in/forum/#!forum/"
	</Location>
</VirtualHost>
