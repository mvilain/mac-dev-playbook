#!/bin/bash
# update python modules 202202.20MeV
# updated to include virtualenv module 202206.22MeV
# removed python 3.7 202207.29MeV
# removed python2.7 upgrade 202210.16MeV
# added python3.10 and 3.11 installed by brew 202211.05MeV
# fix permissions on /usr/local/lib/python3.10/site-packages 202212.16
# added python 3.10.11 as installed as system package 202304.08
# added python 3.12 as installed by brew 202312.10
# added pynvim 202405.30
# added python3.13 2412.25
# removed setuptools from 3.12+3.13 as brew installs it
# moved python 3.12+3.13 to install into pipx as it won't allow updates 202507.11

[ $EUID -ne 0 ] && echo "not root" && exit

# echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
# echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> $(date) python2.7"
# echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
# python2.7 -m pip install --upgrade \
#   altgraph astroid \
#   backports.ssl-match-hostname bdist-mpkg \
#   certifi contextlib2 cycler \
#   docker-pycreds \
#   entrypoints enum34 \
#   funcsigs functools32 \
#   importlib-metadata ipaddress \
#   kiwisolver \
#   List \
#   macholib matplotlib mccabe modulegraph \
#   numpy \
#   pip py2app pyparsing pytz \
#   scandir scipy setuptools singledispatch six subprocess32 \
#   tqdm twine typing \
#   webencodings websocket-client wheel wrapt \
#   xattr \
#   yYAML \
#   zipp zope.interface

for ver in python3.9 python3.10 python3.11; do
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> $(date) ${ver}"
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    ${ver} -m pip install --upgrade \
        ansible ansible-core ansible-lint \
        asn1crypto astroid \
        certifi cffi \
        entrypoints \
        flake8 \
        importlib-metadata isort \
        lazy-object-proxy \
        mccabe \
        pip \
        platformdirs protobuf pycodestyle pycparser pyflakes pylint pynvim PyYAML \
        setuptools six Sphinx sphinxcontrib-napoleon \
        toml tomli typed-ast typing-extensions \
        urllib3 \
        virtualenv \
        wheel wrapt \
        xattr \
        yamllint \
        zipp
done

# 2/16/22 installed ansible...generated with
# # python3.9 -m pip list | awk '!/Package|-----/{printf "\t\t%s \\\n",$1}'

# brew maintains certifi and python-setuptools for python 3.12 or 3.13
# but still set ownership of site-packages; 202507.11
for ver in python3.12 python3.13; do
#   echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
#   echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> $(date) ${ver} pipx"
#   echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
#   brew upgrade certifi python-setuptools
  ${ver} -m pip install --upgrade --break-system-packages filelock pip PyYAML six wheel virtualenv
  for d in /opt/homebrew/lib/${ver}/site-packages /usr/local/lib/${ver}/site-packages; do
    [ -e ${d} ] && sudo chown -R vilain:staff ${d}
  done
done
