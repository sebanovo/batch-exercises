@echo off
del append.txt
del create.txt

echo create > create.txt

echo b >> append.txt
echo e >> append.txt
echo a >> append.txt
echo y >> append.txt
echo o >> append.txt
echo r >> append.txt

type append.txt | sort /R >> ordenado.txt
