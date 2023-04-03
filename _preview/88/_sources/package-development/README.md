# Developing Open Source Software Packages

This section covers best practises of contributing to existing software packages 
and of creating new packages.

## HowTo collaborate

Collaboration is a wide field, not only code contribution.

- **GitHub Discussions**
  - [pyart](https://github.com/ARM-DOE/pyart/discussions)
  - [xarray](https://github.com/pydata/xarray/discussions)
- **Issues**
  - Bug Report eg. [wradlib](https://github.com/wradlib/wradlib/issues/549)
  - Feature Requests eg. [wradlib](https://github.com/wradlib/wradlib/issues/461)
- **Pull Request/Merge Request**

  Not only code but also documentation can be added or extended. Even correcting typos is useful and appreciated by most package maintainers.
  Sometimes issues are labeled (eg `easy first issue`) for easy identification.
  - [wradlib](https://github.com/wradlib/wradlib/pull/550)
  - [pyart](https://github.com/ARM-DOE/pyart/pull/807)
- **Mailing Lists**
  - [wradlib](https://groups.google.com/g/wradlib-users)
  - [xarray](https://groups.google.com/g/xarray)
- **Discourse** 
  - [pangeo](https://discourse.pangeo.io/)
  - [matplotlib](https://discourse.matplotlib.org/)

The main documentation of the projects are a good place to get information about collaboration.
For the projects involved here, those documentation locations can be found here:

https://openradarscience.org/projects/

```{important} 
It's good practice to adhere to the project's Code of Conduct. But in any case - be friendly and welcoming.
```

## HowTo create an own package

```{important}
Advise: use a cookiecutter! 
A cookiecutter is a command-line utility that creates projects from cookiecutters (project templates), e.g. creating a Python package project from a Python package project template.
```

We use the Python cookiecutter-template from https://github.com/audreyr/cookiecutter-pypackage.git but without all bells and whistles.

Let's just create a package with some function, install and test it.



 



