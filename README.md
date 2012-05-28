php-reference - scripts for displaying nicely-formatted PHP documentation

`php-reference` displays a Markdown-formatted version of the online
documentation for a PHP built-in. Its dependencies are listed in
`requirements.txt`, which is a pip requirements file.

`php-short-reference` displays a one-line signature for a PHP function. It has
no external dependencies (other than Python).

To initialise a virtual Python environment in a directory `env`, do something
like this:

    $ virtualenv env
    $ env/bin/pip install -r requirements.txt

Then launch scripts like this:

    $ env/bin/python php-reference array_merge
