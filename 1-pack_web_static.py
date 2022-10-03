#!usr/bin/python3
"""
Fabric script that generates a .tgz archive
from the contents of the web_static folder of
your AirBnB Clone repo, using the function do_pack
"""


from fabric.api import local
from datetime import datetime

from fabric.decorators import runs_once


@runs_once
def do_pack():
    '''generates .tgz archive from the contents of the web_static folder'''
    local("mkdir -p versions")
    date = datetime.now().strftime("%Y%m%d%H%M%S")
    path = (f"versions/web_static_{date}.tgz")
    archive = local(f"tar -cvzf {path} web_static")

    if archive.succedded:
        return path
    return None
