from setuptools import setup

setup(
    name="download_ytb",
    version="1.0",
    py_modules=["download_ytb"],
    install_requires=[
        "pytubefix",
    ],
    entry_points={
        "console_scripts": [
            "download_ytb=download_ytb:main",
        ],
    },
)
