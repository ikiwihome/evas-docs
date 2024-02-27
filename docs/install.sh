#!/bin/sh

echo ******************1.正在安装python和latex环境******************
apt-get install -y python3 latexmk texlive-latex-recommended texlive-fonts-recommended texlive-xetex fonts-freefont-otf fonts-lmodern texlive-lang-chinese
echo ******************python和latex环境已安装完毕******************

echo ******************2.正在安装项目依赖的python库******************
python3 -m pip install -r requirements.txt
echo ******************依赖的python库已安装完毕******************