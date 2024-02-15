
Inject next environment variables to the web service from `/root/compose.yaml` file:
- using .env file that have to be placed at base of your project repository (create .env file with variable `FILE_VAR="hello from the .env file"`). Don't reference it in any way in the CLI or `compose.yaml` file.
- using env_file attribute in the Compose file `/root/compose.yaml` (create env_file.env file with variable `FILE_VAR2="hello from the env_file.env"`).
- using `--env-file` argument in the CLI (create env_file2.env file with variable `FILE_VAR3="hello from the env_file2.env"`).

<br>
<details><summary>Info</summary>
<br>

```plain
- The .env file should sit in the project root alongside your compose.yaml file for variables to be injected into the container.

- The env_file attribute allows multiple .env files in your Compose file, keeping environment variables separate from the main config for better organization and security. No need to place .env in the project root.

- Set default values for multiple environment variables in a file and pass it as a CLI argument. This method allows flexibility in file storage and naming. The file path, relative to the current working directory, is passed using the --env-file option.

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

Create `.env` file in the `/root` directory:

<br>

```plain
cat > /root/.env <<EOF
FILE_VAR="hello from the .env file"
EOF
```{{exec}}

<br>

Run web service and check if the variable is set in the container:

<br>

```plain
docker compose up -d && \
docker compose exec web 'echo $FILE_VAR'
```{{exec}}

<br>

Create `env_file.env` file:

<br>

```plain
cat > /root/env_file.env <<EOF
FILE_VAR2="hello from the env_file.env"
EOF
```{{exec}}

<br>

Update `/root/compose.yaml` file:

<br>

```plain
cat > /root/compose.yaml <<EOF
services:
  web:
    image: nginx:alpine
    env_file:
        - env_file.env
EOF
```{{exec}}


<br>

Run web service and check if the variable is set in the container:

<br>

```plain
docker compose up -d && \
docker compose exec web 'echo $FILE_VAR2'
```{{exec}}


<br>

Create `env_file2.env` file:

<br>

```plain
cat > /root/env_file2.env <<EOF
FILE_VAR2="hello from the env_file2.env"
EOF
```{{exec}}

<br>

Run web service and check if the variable is set in the container:

<br>

```plain
docker compose up -d --env-file env_file2.env && \
docker compose exec web 'echo $FILE_VAR2'
```{{exec}}