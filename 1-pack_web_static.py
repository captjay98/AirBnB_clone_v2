#!/usr/bin/python3
"""
Fabric script that generates a .tgz archive
from the contents of the web_static folder of
your AirBnB Clone repo, using the function do_pack
"""


from fabric.api import local
from datetime import datetime


def do_pack():
    '''generates .tgz archive from the contents of the web_static folder'''
    local("mkdir -p versions")
    date = datetime.now().strftime("%Y%m%d%H%M%S")
    path = ("versions/web_static_{}.tgz".format(date))
    archive = local("tar -cvzf {} web_static".format(path))

    if archive.succeeded:
        return path
    return None
