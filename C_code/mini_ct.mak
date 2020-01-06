##############################################
# Project: C:\uC51\src\si020\mini_ct.mak
# (generated with MakeWiz)
# uC/51 ANSI C Compiler - www.Wickenhaeuser.de
##############################################

L51FLAGS = -r$0,$0
SIOTYPE = P
MODEL = small
A51FLAGS = -g
C51FLAGS = -dCPU_NSEC=46

mini_ct.obj: mini_ct.c
mini_ct.bin: mini_ct.obj
mini_ct.omf: mini_ct.bin

