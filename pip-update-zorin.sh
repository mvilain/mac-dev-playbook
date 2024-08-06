#! /usr/bin/env bash
# update zorin's python3 libraries to local environment 202407.03MeV
# remove duplicity which now uses pipx 202408.05MeV

# should NOT be run as root; should update ~/.local/bin instead
[ $EUID -eq 0 ] && echo "should not be run as root" && exit
 
for ver in /usr/bin/python3; do
  if [ -e $ver ]; then
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> $(date) ${ver}"
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    ${ver} -m pip install --upgrade pip virtualenv
    virtualenv ~/venv
    source ~/venv/bin/activate
    ${ver} -m pip install --upgrade \
     ansible ansible-base ansible-core ansible-lint \
     apache-libcloud \
     apturl \
     argcomplete \
     asn1crypto \
     astroid \
     Babel \
     bcrypt \
     blinker \
     bracex \
     Brlapi \
     cachetools \
     certifi \
     cffi \
     chardet \
     click \
     colorama \
     command-not-found \
     commonmark \
     cryptography \
     cupshelpers \
     defer \
     distlib \
     distro \
     distro-info \
     dnspython \
     enrich \
     entrypoints \
     fasteners \
     filelock \
     flake8 \
     folder-color \
     future \
     google-api-python-client google-auth google-auth-httplib2 \
     greenlet \
     httplib2 \
     icoextract \
     idna \
     importlib-metadata \
     isort \
     jeepney \
     Jinja2 \
     jmespath \
     keyring \
     language-selector \
     launchpadlib \
     lazr.restfulclient \
     lazr.uri \
     lazy-object-proxy \
     lockfile \
     logilab-common \
     louis \
     macaroonbakery \
     Mako \
     MarkupSafe \
     mccabe \
     monotonic \
     more-itertools \
     msgpack \
     mypy-extensions \
     netaddr \
     netifaces \
     ntlm-auth \
     oauth2client \
     oauthlib \
     olefile \
     packaging \
     paramiko \
     pathspec \
     pbr \
     pefile \
     pexpect \
     Pillow \
     platformdirs \
     protobuf \
     psutil \
     ptyprocess \
     pyasn1 pyasn1-modules pycodestyle pycparser pycryptodomex \
     PyDrive pyelftools pyflakes Pygments PyJWT pykerberos pylint \
     pymacaroons PyNaCl pynvim pyOpenSSL pyparsing pyRFC3339 python-dateutil \
     python-vagrant pytz pywinrm pyxdg PyYAML \
     reportlab \
     requests \
     requests-kerberos \
     requests-ntlm \
     requests-toolbelt \
     resolvelib \
     rich \
     rsa \
     ruamel.yaml ruamel.yaml.clib \
     SecretStorage \
     selinux \
     setuptools \
     simplejson \
     six \
     Sphinx sphinxcontrib-napoleon \
     SQLAlchemy \
     ssh-import-id \
     tenacity \
     testresources \
     toml \
     typed-ast \
     typing-extensions \
     ubuntu-drivers-common \
     ufw \
     unattended-upgrades \
     uritemplate \
     urllib3 \
     vboxapi \
     wadllib \
     wcmatch \
     wheel \
     wrapt \
     xattr \
     xdg \
     xkit \
     xmltodict \
     yamllint \
     zipp
     #dbus-python \
     #python-apt \
     #python-debian \
     #zorin-appearance \
     #zorin-connect \
     #zorin-exec-guard
  fi
done
