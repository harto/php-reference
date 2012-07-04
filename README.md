php-reference - scripts for displaying nicely-formatted PHP documentation

`php-reference.py` displays a Markdown-formatted version of the online
documentation for a PHP built-in. Its dependencies are listed in
`requirements.txt`, which is a pip requirements file.

To install, create a virtual Python environment in `env` like this:

    $ virtualenv env
    $ env/bin/pip install -r requirements.txt

Then launch like this:

    $ php-reference array_merge
