# Docker README

- [Why we're using poetry inside of a docker container](#why-were-using-poetry-inside-of-a-docker-container)
    - [Alternative 1: Install poetry packages on the system level.](#alternative-1-install-poetry-packages-on-the-system-level)
    - [Alternative 2: Export dependencies to a requirements.txt file and install via pip](#alternative-2-export-dependencies-to-a-requirementstxt-file-and-install-via-pip)

## Why we're using poetry inside of a docker container

If you look at [./docker-entrypoint.sh](./docker-entrypoint.sh) you will see that we activate a poetry virtual environment before running our docker `CMD` (which is probably some version of `runserver`). This removes the need for us to preface every command in our docker container with `poetry run ...`.

But why are we using poetry virtual environments in docker to begin with? Doesn't using a docker container provide enough isolation on it's own? Isn't using a virtual environment within docker kind of redundant?

Yes. But for now it appears to be better than the other obvious alternatives.

#### Alternative 1: Install poetry packages on the system level.

This would alleviate the need for running a poetry virtual environment. However, apparently there are some bugs that can happen if you install poetry dependencies system-wide: https://github.com/python-poetry/poetry/pull/3209#issuecomment-710678083

#### Alternative 2: Export dependencies to a requirements.txt file and install via pip

This is what I've done in the past. And I might do it again in the future. As of 2022 there's even a new poetry plugin that allows you to export subsets of requirements (eg: with dev dependencies, without dev deps) which used to be a painpoint for this workflow: https://github.com/python-poetry/poetry-plugin-export

So it's an option. But in general, I like having local development environments match deployed environments as much as possible. So if I'm using poetry virtual environments locally, I'd like to do the same thing within docker.

For more information on other alternatives for poetry package installation, see this comment: https://github.com/python-poetry/poetry/discussions/1879#discussioncomment-346113
