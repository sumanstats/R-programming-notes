# How to use updated gcc in Rtools in Windows ?

This is tested on Windows 10 Home edition with [R v3.5.0](https://cran.r-project.org/src/base/R-3/R-3.5.0.tar.gz) and [Rtools35](https://cran.r-project.org/bin/windows/Rtools/Rtools35.exe). I borrowed ideas [from here](https://stackoverflow.com/questions/25455829/using-a-different-gcc-version-from-that-included-with-rtools-with-rcpp-on-window).


Here I describe how we can use **GCC v7.3** with Rtools to compile source packages in R.

1. Install [R](https://www.r-project.org/)
2. Install [Rtools](https://cran.r-project.org/bin/windows/Rtools/Rtools35.exe). The default installation location will be `C:\Rtools`. You will see following subfolders inside `Rtools`:

![](https://i.imgur.com/QwhHJeb.png)

Delete whatever is present **inside** `mingw_64` subfolder.

3. Set the path so that `Rtools` is in path by editing environment variable as below:

![](https://i.imgur.com/cbadT4G.png)


4. Now go to download gcc from [this MinGW distro](https://nuwen.net/mingw.html). Download [mingw-15.4-without-git.exe](https://nuwen.net/files/mingw/mingw-15.4-without-git.exe). 

![](https://i.imgur.com/I2ZYG9z.png)

Install in its default location wherever. Note that it will get installed in `MinGW\` folder. Copy/Cut whatever is **inside** this `MinGW\` folder.

5. Go to `mingw_64` **subfolder** inside `Rtools` and paste whatever been copied/cut in step 3. After pasting you will see this:

![](https://i.imgur.com/uGQSktP.png)

6. Test your setup to compile C/C++ code in R package with following lines in `R` console:
```
remove.packages("data.table")
install.packages("data.table", type = "source",
    repos = "http://Rdatatable.github.io/data.table")
```
If successful, you will find something like this:

![](https://i.imgur.com/MmIc3dq.png)

You are done.
