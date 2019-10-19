# codeclimate-phpstan

## Build image
Image can be built by running `make`

This will produce an image tagged as `codeclimate/codeclimate-phpstan`

## Configuration Options
PHPStan options can be supplied to the container via a json file mounted to `config.json`

```
{
   "include_paths":[
      "src"
   ],
   "level":0,
   "paths_file":".phpstan_paths",
   "autoload_file":"vendor/autoload.php",
   "project_config_file":"custom_phpstan.neon"
}
```
Read more about [PHPStan configuration](https://github.com/phpstan/phpstan)

## Local usage

The engine can be invoked locally against a codebase using default settings using the following command:

```
docker run -v $PWD:/code:ro -v $PWD/config.json:/config.json codeclimate/codeclimate-phpstan
```