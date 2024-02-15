
Inject next environment variables to the web service from `/root/compose.yaml` file:
- using -e (or --env) flag in the CLI (create variable `CLI_VAR="hello from the CLI"`)
- using shell variable `SHELL_VAR` (inject with environment attribute)



<br>
<details><summary>Info</summary>
<br>

```plain
Using -e (--env) flag to set environment variables is the same as for the docker command

Regarding shell variables, Compose looks for the environment variable in the shell and substitutes its value in.
If an environment variable is not set, Compose substitutes with an empty string.

Documentation - https://docs.docker.com/compose/environment-variables/set-environment-variables/.
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
Use `docker compose exec web sh` to get into the shell of the container.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Run web service with variable `CLI_VAR="hello from the CLI"` set in the CLI:

<br>

```plain
docker compose up -d --env CLI_VAR="hello from the CLI" && \
docker compose exec web 'echo $CLI_VAR'
```{{exec}}


<br>

Update `/root/compose.yaml` file:

<br>

```plain
cat > /root/compose.yaml <<EOF
services:
  web:
    image: nginx:alpine
    environment:
        - SHELL_VAR=${SHELL_VAR}
EOF
```{{exec}}

<br>

Run web service and check if the variable is set in the container:

<br>

```plain
docker compose up -d && \
docker compose exec web 'echo $SHELL_VAR'
```{{exec}}