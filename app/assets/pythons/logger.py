#!/usr/bin/env python
# -*- coding: utf-8 -*-

import logging

logging.basicConfig(filename='/vagrant/Rails/myhelper/app/assets/pythons/logger.log',level=logging.DEBUG, format="%(asctime)s %(levelname)s %(message)s")
logging.info('start python job')
print "logging"
