#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import os
# 调用com组件包
import comtypes.client

# 第一步:得到ptr


def init_powerpoint():
    powerpoint = comtypes.client.CreateObject("Powerpoint.Application")
    powerpoint.Visible = 1
    return powerpoint

# 第二步:找到该路径下的所有ppt(x)文件,并将其路径添加到cwd


def convert_files_in_folder(powerpoint, folder):
    # 将当前所有文件及文件夹添加进列表
    files = os.listdir(folder)
    print('files:', files)
    # 将所有以.ppt(x)结尾的文件加入cwd path
    pptfiles = [f for f in files if f.endswith((".ppt", ".pptx"))]
    for pptfile in pptfiles:
        # 加入判断,如果当前转换成的pdf已存在,就跳过不添加
        print(pptfile)
        if pptfile + '.pdf' in files:
            break
        # 加入cwd环境
        fullpath = os.path.join(cwd, pptfile)
        ppt_to_pdf(powerpoint, fullpath, fullpath)


def ppt_to_pdf(powerpoint, inputFileName, outputFileName, formatType=32):
    # 第三步:将cwd路径下转换成pdf格式
    # 切片取后缀是否为pdf
    if outputFileName[-3:] != 'pdf':
        outputFileName = outputFileName + ".pdf"
    # 调用接口进行转换
    deck = powerpoint.Presentations.Open(inputFileName)
    deck.SaveAs(outputFileName, formatType)  # formatType = 32 for ppt to pdf
    deck.Close()

if __name__ == "__main__":
    # 得到PowerPoint应用的ptr
    powerpoint = init_powerpoint()
    # print(powerpoint)
    # 得到当前路径
    cwd = os.getcwd()

    # 打印当前路径
    print(cwd)
    # 调用powerpoit进行转换cwd path下的ppt(x)格式
    convert_files_in_folder(powerpoint, cwd)
    # 转换结束后关闭
    powerpoint.Quit()
