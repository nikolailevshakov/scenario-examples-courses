
Build image from /root/Dockerfile and name it `cmd-echo`.
Check what is cmd and entrypoint of the base `alpine` and newly created `cmd-echo` image.
Run the container from the `cmd-echo`:
- with default cmd and entrypoint values
- with another message `hi, from the updated image`
- with entrypoint `date`

<br>
<details><summary>Info</summary>
<br>

```plain
Documentation: https://docs.docker.com/engine/reference/builder/#cmd

There can only be one CMD instruction in a Dockerfile.
If you list more than one CMD, only the last one takes effect.

Every container have entrypoint and cmd.
If you don't provide new entrypoint, then the entrypoint from the base image will be used.
Which is shell in the majority of cases.

The purpose of a CMD is to provide defaults for an executing container.
However, it can be used as a way to provide an executable and defaults.
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
Use docker run --rm cmd-image to remove container after it finished.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Build docker image `/root/Dockerfile`:

<br>

```plain
docker build -t cmd-echo /root/
```{{exec}}

<br>

Explore cmd and entrypoint of `alpine` and `cmd-echo`:

<br>

```plain
docker inspect alpine | grep cmd, entrypoint
docker inspect cmd-echo | grep cmd, entrypoint
```{{exec}}

<br>

Run the container with default values:

<br>

```plain
docker run --rm cmd-echo
```{{exec}}

<br>

Run the container with updated message:

<br>

```plain
docker run --rm cmd-echo -- echo "hi, from the updated image"
or
docker run --rm --cmd "echo hi, from the updated image" cmd-echo
```{{copy}}

<br>

Run the container with entrypoint `date`:

<br>

```plain
docker run --rm --entrypoint date cmd-echo
```{{exec}}


</details>