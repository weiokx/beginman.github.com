#!/bin/bash
git pull origin master;
git add -A;
git ci -m "自动生成";
git push origin master;


