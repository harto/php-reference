php-reference - scripts for displaying nicely-formatted PHP documentation

`php-reference` displays a Markdown-formatted version of the online
documentation for a PHP built-in. Its dependencies are listed in
`requirements.txt`, which is a pip requirements file.

To initialise a virtual Python environment in a directory `env`, do something
like this:

    $ virtualenv env
    $ env/bin/pip install -r requirements.txt

Then launch like this:

    $ env/bin/python php-reference.py array_merge
