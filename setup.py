from setuptools import setup, find_packages

setup(
    name="PySide6_FeatherIcons_QML",
    author="Cuberootex",
    description="Adds Feather Icons usable in QML for PySide6",
    long_description=open("README.md").read(),
    version="0.1.0",
    packages=find_packages(),
    include_package_data=True,
    license="MIT",
    install_requires=["PySide6>=6.5.0"],
    python_requires=">=3.8",
    classifiers=[
        "License :: OSI Approved :: MIT License"
        "Programming Language :: Python :: 3",
        "Operating System :: OS Independent",
    ],
    keywords="PySide Qt PySide6 Feather Icons QML",
)
