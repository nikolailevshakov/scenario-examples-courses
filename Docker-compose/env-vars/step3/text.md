
Using `/root/precedence/compose.yaml` file override VAR1 and VAR2 values on `overriden`:
- don't delete any files in /root/precedence directory
- don't delete any line of code in /root/precedence/compose.yaml file (it's allowed to add new lines)

For practice purposes try to do it with 2 different ways.

<br>
<details><summary>Info</summary>
<br>

```plain
The order of precedence from highest to lowest:

1) Set using docker compose run -e in the CLI
2) Substituted from your shell
3) Set using just the environment attribute in the Compose file
4) Use of the --env-file argument in the CLI
5) Use of the env_file attribute in the Compose file
6) Set using an .env file placed at base of your project directory

Documentation - https://docs.docker.com/compose/environment-variables/envvars-precedence/.
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
Use `docker compose exec web2 sh` to get into the shell of the container.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Override VAR1 by using -e flag in the CLI:

<br>

```plain
docker compose up -d -e VAR1='overriden' && \
docker compose exec web2 'echo $VAR1'
```{{exec}}

<br>

Override VAR2 by using environment attribute in the compose file:

<br>

```plain
cat > /root/precedence/compose.yaml <<EOF
services:
  web2:
    image: nginx:alpine
  env_file:
    - /root/precedence/envs.env
  environment:
    - VAR2='overriden'
EOF
```{{exec}}

<br>

Run web2 service and check if the variable is set in the container:

<br>

```plain
docker compose up -d && \
docker compose exec web2 'echo $VAR2'
```{{exec}}
