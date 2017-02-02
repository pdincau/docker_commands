## 1 Getting started with docker images ###
You can start by copying into your computer an image:

```sh
docker pull image-name
```

Now you should see that image into the list of your local images:

```sh
docker images
```

If you want you can erase it, but you will have to pull it agaiin next time you will need it:

```sh
docker rmi [image-name]
```

## 2 Build an image from a Dockerfile ###

Let's build the image:

```sh
docker build -t pdincau/workshop_java_8
```

Now we can run a command inside the newly created image:

```sh
docker run -it workshop_java_8 /bin/sh
```

But what happens when you exit from the terminal? The container is gone
and you don't see it anymore. Let's try with:

```sh
docker ps -a
```

Let's know try:

```
docker run -it workshop_java_8 java -version
```

## Let's build images for our services ##

Move inside the project ```name_day_greeter```:

Build the docker image as:

```sh
docker build -t pdincau/name_day_greeter:latest --rm=true .
```

When we run our container we need to expose our port:

```sh
docker run -it -p 81:8080 pdincau/name_day_greeter
```

We can check whether the image exists:

```
docker images
```

Let's see the history of this image:

```sh
docker history [container id]
```

Let's run it in detached mode:

```
docker run -d -p 81:8080 pdincau/pdincau/name_day_greeter
```

Let's see what happens in this container by checking the logs or by entering it:

```sh
docker logs -f [container id]
....
docker exec -it [container id] /bin/sh
```

Now let's stop it:

```
docker stop [container id]
```

Now let's build ```employee_admin```:

```
docker build -t pdincau/employee_admin:latest
```

Let's now run it by with the needed environment variables:

```
docker run -it -e URL=http://10.0.0.192:81/people -p 80:8080 pdincau/employee_admin
```

## Push to the docker registry

First of all you should login:

```sh
docker login
```

And now let's push the image:

```sh
docker push [image name]
```

