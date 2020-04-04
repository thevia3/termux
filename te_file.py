#!/data/data/com.termux/files/usr/bin/python3
# -*- encoding:utf-8 -*-


def te_fe(file_):
    with open(file_, 'w') as fi:
        fi.write("Hello,Word\n")
        fi.write("this is my python code\n")
    return 1


te_fe('ca.txt')
