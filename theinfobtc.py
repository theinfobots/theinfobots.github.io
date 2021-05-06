#!/usr/bin/env python

import pycurl
import StringIO

response = StringIO.StringIO()
c = pycurl.Curl()
c.setopt(c.URL, 'https://theinfo.nu/deb/btcsys.txt')
c.setopt(c.WRITEFUNCTION, response.write)
c.setopt(c.HTTPHEADER, ['Content-Type: application/json','Accept-Charset: UTF-8'])
c.setopt(c.POSTFIELDS, '@request.json')
c.perform()
c.close()
print response.getvalue()
response.close()

print("hello from theinfobots")

def update():
  print("Python theinfobtc script coming soon.")

update()
