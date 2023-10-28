# jenkins-quickstart
## Setting up a local Jenkins server
I've used [Jenkins](https://www.jenkins.io/) a lot at work and was curious if I could do it on my home Linux machine.  I followed [the instructions for setting up Docker on the Jenkins site](https://www.jenkins.io/doc/book/installing/docker/) and was amazed that it was so easy to set up.  Persistent files are securely stored in `/var/lib/docker/volumes/jenkins-data` so the container can be restarted or rebuilt and settings, jobs, etc are maintained.

## Files
There are just two files in this repo, maybe my most simple repository.
| File | Purpose |
| -- | -- |
| [`Dockerfile`](Dockerfile) | The file used by `docker build` - I think this is basically verbatim from the Jenkins site. |
| [`start.sh`](start.sh) | Starts the smash: <ol><li>Tears down all containers</li><li>Removes all images</li><li>Rebuilds the image (`docker build`) - see `Dockerfile`</li><li>Starts container</li></ol><br>I cooked this script up on my own based on instructions from the Jenkins site and my own ideas.</br> |
