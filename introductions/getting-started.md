# Getting Started

## 1. Make Sure You Have a Github Account
The first step is to make sure you have a Github Account.

Here is the link if you do have one already:
- [Github account creation link](https://github.com/join)

## 2. Log into Pangeo Binder
Next, sign in and authenticate the Pangeo Binder, which is the platform we will use for the workshop:
- [Pangeo Binder Link](https://aws-uswest2-binder.pangeo.io)

## 3. Launch our Environment
Now that we have our authentication set up, we can access our content!

Use the following link to launch into the binder:
- [Binder Link](https://aws-uswest2-binder.pangeo.io/v2/gh/openradar/erad2022/main?labpath=notebooks)

If you are having issues with that (ex. it is taking a long time), try using the following link:
```
https://hub.aws-uswest2-binder.pangeo.io/user/{your_github_username}/lab
```
Where you replace `{your_github_username}` with your github username (ex. `mgrover1`)

## Description of the build workflow

### Build on GitHub on PullRequest

1. [repo2docker-action](https://github.com/jupyterhub/repo2docker-action) is used to build the docker image 
    - docker layers will be cached from ghcr.io (https://github.com/openradar/erad2022/pkgs/container/erad2022)
    - image is not pushed, since GITHUB_TOKEN `write` is not available as per security policy
1. book is built in a second step using [docker-run-action](https://github.com/addnab/docker-run-action), zipped and uploaded as artifact
1. book is deployed to gh-pages, link is added to pr comment

### Build on GitHub on Push

1. repo2docker-action is used to build the docker image 
    - docker layers will be cached from ghcr.io (https://github.com/openradar/erad2022/pkgs/container/erad2022)
    - image is pushed to ghcr.io (https://github.com/openradar/erad2022/pkgs/container/erad2022)
1. book is built in a second job directly inside ghcr.io (https://github.com/openradar/erad2022/pkgs/container/erad2022), zipped and uploaded as artifact  
1. book is deployed to gh-pages https://openradarscience.org/erad2022/  

Depending on the changes in the repo the build times can be quite low as docker layer caching is facilitated. 

### Build & run locally

If you want to build and run locally using `repo2docker` you would need to remove (temporarily) the `binder/Dockerfile`. Then you would need to invoke the build with:

```
$ repo2docker --appendix "`cat binder/appendix.txt`" .
```

This will build the docker image locally and fire up a container running jupyterlab.

### Run locally

If you want to just run locally using `repo2docker` you will just use the provided `binder/Dockerfile`. Then you would need to invoke the run with:

```
$ repo2docker .
```

This will fetch the docker image from ghcr and fire up a container running jupyterlab.


### Conclusion

- Docker images are built using GHA with all essential components inside (and pushed to ghcr.io on push)
- On binder we are using now our prebuild images on ghcr.io https://github.com/openradar/erad2022/pkgs/container/erad2022. As we are using `appendix` instead of `postBuild` no compilations are necessary on the binder side, the images is used as is with some minor adaptions by binder.
- On GHA we are using our prebuild images as layer cache, but layers can't be updated on pull requests due to security reasons.
- The erad2022 package on https://ghcr.io/openradar/erad2022:latest represents always the status of the most recent commit to the repo.
- Running locally as well as building & running is easily possible.
