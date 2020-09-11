#!/bin/bash

pyenv install 3.7.9
mkdir -p $HOME/.cache/pypoetry/virtualenvs/
poetry env use /home/earv1/.pyenv/versions/3.7.9/bin/python
poetry update