#!/usr/bin/env python
# -*- coding: utf-8 -*-

import Rails
print('Rails.root= ' + Rails.root())


import logging
#logging.basicConfig(filename='/vagrant/Rails/myhelper/app/assets/pythons/log.log',level=logging.DEBUG, format="%(asctime)s %(levelname)s %(message)s")
logging.basicConfig(filename = Rails.root() + '/app/assets/pythons/log.log',level=logging.DEBUG, format="%(asctime)s %(levelname)s %(message)s")
logging.info('start python job (copy.py)')



import sys
import os
import glob
import shutil

# make directry for copy files
argvs = sys.argv
if len(argvs) < 2:
    print('lack of argvs: ' + argvs[0])
    exit(0)

order_id = argvs[1]

path_src = Rails.images() + order_id + Rails.images_origin_dir_name()
path_dst = Rails.images() + order_id + Rails.images_tmp_dir_name()
#path_dir = Rails.root() + '/app/assets/pythons/TMPdir'

logging.info('copy src path= ' + path_src)
logging.info('copy dst path= ' + path_dst)
if os.path.exists(path_src):
    print( 'path_src is exist')
    if not os.path.exists(path_dst):
        os.makedirs(path_dst)

    # get file list
    files_origin = glob.glob(path_src + '/*')

    # do cppy
    for file_origin in files_origin:
       shutil.copy(file_origin, path_dst)
    

#os.makedirs()

