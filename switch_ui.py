#! /usr/bin/python3

script = "./switch_cli.sh"

import tkinter as tk
import os

def change_meeting():
        os.system(script+' meeting')
       
def change_music():
	os.system(script+' music')
 

root = tk.Tk()
root.title('Xbox Wireless Headset Switcher')

t_btn = tk.Button(text='Switch Meeting mode', width=15, command=change_meeting)
t_btn2 = tk.Button(text='Switch Music mode', width=15, command=change_music)
t_btn.pack(pady=5)
t_btn2.pack(pady=5)

root.mainloop()
