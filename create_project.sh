#!/bin/bash

PROJECT_NAME=$1

echo creating $PROJECT_NAME project structure

## create folder
mkdir $PROJECT_NAME
cd $PROJECT_NAME

## Create new virtual enviroment
virtualenv -p /home/wedeueis/anaconda3/bin/python3 venv

## Activate env 
source venv/bin/activate

## Install and register the kernel
pip3 install ipykernel

python3 -m ipykernel install --user --name $1 --display-name "Python $PROJECT_NAME"

## Update jupyter
pip3 install -U jupyter

## Install basic ml libs 
pip3 install pandas sklearn numpy matplotlib

## enable git version control 
git init

## create folders structure
mkdir data && mkdir models && mkdir src

## create README file
touch README.md

## initialize code
code .

## configure git ignore file
printf "venv/\ndata/\nmodels/\n.ipynb_checkpoints/\n*/__pycache__/*\n*.pyc\n.vscode\n.gitignore" >> .gitignore

