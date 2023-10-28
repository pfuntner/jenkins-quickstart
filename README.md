# jenkins-quickstart
## Setting up a local Jenkins server
I've used [Jenkins](https://www.jenkins.io/) a lot at work and was curious if I could do it on my home Linux machine.  I followed [the instructions for setting up Docker on the Jenkins site](https://www.jenkins.io/doc/book/installing/docker/) and was amazed that it was so easy to set up.  Persistent files are securely stored in `/var/lib/docker/volumes/jenkins-data` so the container can be restarted or rebuilt and settings, jobs, etc are maintained.

### Restarts
I guess I'm not a super sophisicated Docker guy but the way the Jenkins instructions had me set up the container (`docker run ... --restart=on-failure ...`), it will restart automatically!

Check this out:
1. I had the container running for a couple of weeks
2. I was replacing the baking element in my oven at home, was fumbling with the circuit breakers (long story) and switched off the power for the Linux machine too.  I didn't have it off for long but when I returned to the computer, it was at the login screen so the Linux machine automatically booted
3. I also restored tabs in Chrome, noticed I still had a tab for my Jenkins server, and clicked it without thinking - but I began to think, wait, I just rebooted, the server isn't up.  I need to restart the container
4. I was amazed that the container was restarted!  I didn't even have to log back into Jenkins in Chrome!  Great!

## Files
There are just two files in this repo, maybe my most simple repository.
| File | Purpose |
| -- | -- |
| [`Dockerfile`](Dockerfile) | The file used by `docker build` - I think this is basically verbatim from the Jenkins site. |
| [`start.sh`](start.sh) | Starts the smash: <ol><li>Tears down all containers</li><li>Removes all images</li><li>Rebuilds the image (`docker build`) - see `Dockerfile`</li><li>Starts container</li></ol><br>I cooked this script up on my own based on instructions from the Jenkins site and my own ideas.</br> |
